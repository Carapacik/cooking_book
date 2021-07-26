using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Repositories;
using RecipeBook.Api.Infrastructure;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;
        private readonly IUnitOfWork _unitOfWork;

        public RecipesController(IRecipeRepository recipeRepository, IUnitOfWork unitOfWork)
        {
            _recipeRepository = recipeRepository;
            _unitOfWork = unitOfWork;
        }

        [HttpPost]
        public int AddRecipe([FromBody] AddRecipeCommandDto addCommand)
        {
            var newRecipe = addCommand.Convert();
            _recipeRepository.Add(newRecipe);
            _unitOfWork.Commit();

            return newRecipe.RecipeId;
        }

        [HttpGet("recipe-of-day")]
        public RecipeOfDayDto GetRecipeOfDay()
        {
            return new()
            {
                RecipeId = 1,
                Title = "Тыквенный супчик на кокосовом молоке",
                Description = "Если у вас осталась тыква, и вы не знаете что с ней сделать, то это решение для вас! Ароматный, согревающий суп-пюре на кокосовом молоке.",
                ImageUrl = "assets/images/recipe_of_day.png",
                CookingTimeInMinutes = 35,
                LikesCount = 365,
                Username = "@glazest"
            };
        }
    }
}