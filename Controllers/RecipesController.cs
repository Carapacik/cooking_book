using Microsoft.AspNetCore.Mvc;
using RecipeBook.Entities;
using RecipeBook.Repositories;

namespace RecipeBook.Controllers
{
    [ApiController]
    [Route("recipes")]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;

        public RecipesController(IRecipeRepository recipeRepository)
        {
            _recipeRepository = recipeRepository;
        }

        // [HttpGet]
        // public RecipeEntity Get()
        // {
        //     return _recipeRepository.GetById("");
        // }
    }
}