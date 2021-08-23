using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RecipeBook.Api.Builder;
using RecipeBook.Api.Converters;
using RecipeBook.Api.Dtos;
using RecipeBook.Application;
using RecipeBook.Application.Entities;
using RecipeBook.Application.Services;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route( "api/[controller]" )]
    public class RecipesController : ControllerBase
    {
        private readonly RecipeBuilder _recipeBuilder;
        private readonly IRecipeRepository _recipeRepository;
        private readonly IRecipeService _recipeService;
        private readonly IUnitOfWork _unitOfWork;

        public RecipesController(
            IRecipeRepository recipeRepository,
            IUnitOfWork unitOfWork,
            IRecipeService recipeService,
            RecipeBuilder recipeBuilder )
        {
            _recipeRepository = recipeRepository;
            _unitOfWork = unitOfWork;
            _recipeService = recipeService;
            _recipeBuilder = recipeBuilder;
        }

        [HttpPost]
        [Authorize]
        [DisableRequestSizeLimit]
        public int AddRecipe()
        {
            string username = User.Identity?.Name;
            Recipe newRecipe = _recipeService.AddRecipe( ParseRecipeCommand( Request.Form, username ) );
            _unitOfWork.Commit();
            return newRecipe.RecipeId;
        }

        [HttpDelete( "{id:int}/delete" )]
        [Authorize]
        public void DeleteRecipe( int id )
        {
            string username = User.Identity?.Name;
            _recipeService.DeleteRecipe( id, username );
            _unitOfWork.Commit();
        }

        [HttpPatch( "{id:int}/edit" )]
        [Authorize]
        [DisableRequestSizeLimit]
        public int EditRecipe( int id )
        {
            string username = User.Identity?.Name;
            Recipe newRecipe = _recipeService.EditRecipe( ParseRecipeCommand( Request.Form, username, id ) );
            _unitOfWork.Commit();

            return newRecipe.RecipeId;
        }

        [HttpGet( "{id:int}" )]
        public RecipeDetailDto GetDetailRecipe( int id )
        {
            Recipe recipe = _recipeRepository.GetById( id );
            if ( recipe == null )
            {
                throw new ValidationException( $"Recipe with id:{id} does not exist" );
            }

            string username = User.Identity?.Name;
            return _recipeBuilder.BuildRecipeDetail( recipe, username );
        }

        [HttpGet( "recipe-of-day" )]
        public RecipeOfDayDto GetRecipeOfDay()
        {
            Recipe recipe = _recipeRepository.GetRecipeOfDay();
            if ( recipe == null )
            {
                throw new ValidationException( "Recipe does not exist" );
            }

            return _recipeBuilder.BuildRecipeOfDay( recipe );
        }

        [HttpGet( "favorite" )]
        [Authorize]
        public List<RecipeDto> GetFavoriteRecipes( [FromQuery] int skip, [FromQuery] int take )
        {
            string username = User.Identity?.Name;
            IReadOnlyList<Recipe> searchResult = _recipeService.GetFavoriteRecipes( skip, take, username );
            return _recipeBuilder.BuildRecipes( searchResult, username );
        }

        [HttpGet( "user-owned" )]
        [Authorize]
        public List<RecipeDto> GetUserOwnedRecipes( [FromQuery] int skip, [FromQuery] int take )
        {
            string username = User.Identity?.Name;
            IReadOnlyList<Recipe> searchResult = _recipeService.GetUserOwnedRecipes( skip, take, username );
            return _recipeBuilder.BuildRecipes( searchResult, username );
        }

        [HttpGet]
        public List<RecipeDto> GetAllRecipes(
            [FromQuery] int skip,
            [FromQuery] int take,
            [FromQuery] string searchQuery )
        {
            IReadOnlyList<Recipe> searchResult = _recipeRepository.Search( skip, take, searchQuery );

            string username = User.Identity?.Name;
            return _recipeBuilder.BuildRecipes( searchResult, username );
        }

        private static RecipeCommand ParseRecipeCommand( IFormCollection formCollection, string username, int id = 0 )
        {
            RecipeCommandDto recipeData = JsonConvert.DeserializeObject<RecipeCommandDto>( formCollection[ "data" ] );
            if ( recipeData == null )
            {
                throw new ArgumentException( "Data is null" );
            }

            recipeData.RecipeId = id;
            IFormFile formFile = null;
            if ( formCollection.Files.Count > 0 )
            {
                formFile = formCollection.Files[ 0 ];
            }

            return recipeData.ConvertToRecipeCommand( FormFileAdapter.Create( formFile ), username );
        }
    }
}
