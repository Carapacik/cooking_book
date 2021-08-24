using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
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
        public async Task<int> AddRecipe()
        {
            string username = User.Identity?.Name;
            Recipe newRecipe = await _recipeService.AddRecipe( ParseRecipeCommand( Request.Form, username ) );
            await _unitOfWork.Commit();
            return newRecipe.RecipeId;
        }

        [HttpDelete( "{id:int}/delete" )]
        [Authorize]
        public async Task DeleteRecipe( int id )
        {
            string username = User.Identity?.Name;
            await _recipeService.DeleteRecipe( id, username );
            await _unitOfWork.Commit();
        }

        [HttpPatch( "{id:int}/edit" )]
        [Authorize]
        [DisableRequestSizeLimit]
        public async Task<int> EditRecipe( int id )
        {
            string username = User.Identity?.Name;
            Recipe newRecipe = await _recipeService.EditRecipe( ParseRecipeCommand( Request.Form, username, id ) );
            await _unitOfWork.Commit();

            return newRecipe.RecipeId;
        }

        [HttpGet( "{id:int}" )]
        public async Task<RecipeDetailDto> GetDetailRecipe( int id )
        {
            Recipe recipe = await _recipeRepository.GetById( id );
            if ( recipe == null )
            {
                throw new ValidationException( $"Recipe with id:{id} does not exist" );
            }

            string username = User.Identity?.Name;
            return await _recipeBuilder.BuildRecipeDetail( recipe, username );
        }

        [HttpGet( "recipe-of-day" )]
        public async Task<RecipeOfDayDto> GetRecipeOfDay()
        {
            Recipe recipe = await _recipeRepository.GetRecipeOfDay();
            if ( recipe == null )
            {
                throw new ValidationException( "Recipe does not exist" );
            }

            return await _recipeBuilder.BuildRecipeOfDay( recipe );
        }

        [HttpGet( "favorite" )]
        [Authorize]
        public async Task<List<RecipeDto>> GetFavoriteRecipes( [FromQuery] int skip, [FromQuery] int take )
        {
            string username = User.Identity?.Name;
            IReadOnlyList<Recipe> searchResult = await _recipeService.GetFavoriteRecipes( skip, take, username );
            return await _recipeBuilder.BuildRecipes( searchResult, username );
        }

        [HttpGet( "user-owned" )]
        [Authorize]
        public async Task<List<RecipeDto>> GetUserOwnedRecipes( [FromQuery] int skip, [FromQuery] int take )
        {
            string username = User.Identity?.Name;
            IReadOnlyList<Recipe> searchResult = await _recipeService.GetUserOwnedRecipes( skip, take, username );
            return await _recipeBuilder.BuildRecipes( searchResult, username );
        }

        [HttpGet]
        public async Task<List<RecipeDto>> GetAllRecipes(
            [FromQuery] int skip,
            [FromQuery] int take,
            [FromQuery] string searchQuery )
        {
            IReadOnlyList<Recipe> searchResult = await _recipeRepository.Search( skip, take, searchQuery );

            string username = User.Identity?.Name;
            return await _recipeBuilder.BuildRecipes( searchResult, username );
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
