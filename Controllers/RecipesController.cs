using Microsoft.AspNetCore.Mvc;
using RecipeBook.Application.Entities;
using RecipeBook.Application.Repositories;

namespace RecipeBook.Controllers
{
    [ApiController]
    [Route("api/recipes")]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;

        public RecipesController(IRecipeRepository recipeRepository)
        {
            _recipeRepository = recipeRepository;
        }

        [HttpGet]
        public Recipe Get(int id)
        {
            return _recipeRepository.GetById(id);
        }
    }
}