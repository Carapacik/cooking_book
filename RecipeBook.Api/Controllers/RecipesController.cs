using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("api/recipe")]
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
            return new Recipe();
            return _recipeRepository.GetById(id);
        }
    }
}