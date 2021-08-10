using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RecipeBook.Api.Converters;
using RecipeBook.Api.Dtos;
using RecipeBook.Application;
using RecipeBook.Application.Services;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route( "api/[controller]" )]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;
        private readonly IRecipeService _recipeService;
        private readonly IUnitOfWork _unitOfWork;

        public RecipesController( IRecipeRepository recipeRepository, IUnitOfWork unitOfWork, IRecipeService recipeService )
        {
            _recipeRepository = recipeRepository;
            _unitOfWork = unitOfWork;
            _recipeService = recipeService;
        }

        [HttpPost]
        [DisableRequestSizeLimit]
        public int AddRecipe()
        {
            AddRecipeCommandDto recipeData = JsonConvert.DeserializeObject<AddRecipeCommandDto>( Request.Form[ "recipe" ] );
            IFormFile formFile = null;
            if ( Request.Form.Files.Count > 0 ) formFile = Request.Form.Files[ 0 ];
            Recipe newRecipe = _recipeService.AddRecipe( recipeData.ConvertToAddRecipeCommand( FormFileAdapter.Create( formFile ) ) );
            _unitOfWork.Commit();
            return newRecipe.RecipeId;
        }

        [HttpDelete( "{id:int}/delete" )]
        public void DeleteRecipe( int id )
        {
            _recipeService.DeleteRecipe( id );
            _unitOfWork.Commit();
        }

        [HttpPatch( "{id:int}/edit" )]
        [DisableRequestSizeLimit]
        public int EditRecipe( int id )
        {
            EditRecipeCommandDto recipeData = JsonConvert.DeserializeObject<EditRecipeCommandDto>( Request.Form[ "recipe" ] );
            IFormFile formFile = null;
            if ( Request.Form.Files.Count > 0 ) formFile = Request.Form.Files[ 0 ];
            Recipe newRecipe = _recipeService.EditRecipe( recipeData.ConvertToEditRecipeCommand( FormFileAdapter.Create( formFile ) ) );
            _unitOfWork.Commit();
            return newRecipe.RecipeId;
        }

        [HttpGet( "{id:int}" )]
        public RecipeDetailDto GetDetailRecipe( int id )
        {
            Recipe recipe = _recipeRepository.GetById( id );
            return recipe.ConvertToRecipeDetailDto();
        }

        [HttpGet( "recipe-of-day" )]
        public RecipeOfDayDto GetRecipeOfDay()
        {
            Recipe recipe = _recipeRepository.GetRecipeOfDay();
            return recipe.ConvertToRecipeOfDayDto();
        }

        [HttpGet]
        public List<RecipeDto> GetRecipes(
            [FromQuery] int skip,
            [FromQuery] int take,
            [FromQuery] string searchQuery )
        {
            IReadOnlyList<Recipe> searchResult = _recipeRepository.Search( skip, take, searchQuery );
            return searchResult.Select( x => x.ConvertToRecipeDto() ).ToList();
        }
    }
}
