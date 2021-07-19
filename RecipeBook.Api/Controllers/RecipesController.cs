using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;

        public RecipesController(IRecipeRepository recipeRepository)
        {
            _recipeRepository = recipeRepository;
        }

        [HttpGet]
        public RecipeOfDayDto GetRecipeOfDay()
        {
            return new()
            {
                RecipeId = 1,
                Title = "Тыквенный супчик на кокосовом молоке",
                Description =
                    "Если у вас осталась тыква, и вы не знаете что с ней сделать, то это решение для вас! Ароматный, согревающий суп-пюре на кокосовом молоке.",
                ImageUrl = "картинка-тыквы.jpg",
                CookingTimeInMinutes = 35,
                LikesCount = 365,
                Username = "@glazest"
            };
        }
    }
}