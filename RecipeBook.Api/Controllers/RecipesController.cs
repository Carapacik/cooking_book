using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Repositories;
using RecipeBook.Api.Application.Services;
using RecipeBook.Api.Infrastructure;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecipesController : ControllerBase
    {
        private readonly IRecipeRepository _recipeRepository;
        private readonly IRecipeService _recipeService;
        private readonly IUnitOfWork _unitOfWork;

        public RecipesController(IRecipeRepository recipeRepository, IUnitOfWork unitOfWork, IRecipeService recipeService)
        {
            _recipeRepository = recipeRepository;
            _unitOfWork = unitOfWork;
            _recipeService = recipeService;
        }

        [HttpPost]
        [DisableRequestSizeLimit]
        public int AddRecipe()
        {
            var imageFile = Request.Form.Files[0];
            var addCommandDto = JsonConvert.DeserializeObject<AddRecipeCommandDto>(Request.Form["recipe"]);
            var adaptedFile = FormFileAdapter.Create(imageFile);
            var newRecipe = _recipeService.AddRecipe(adaptedFile, addCommandDto);

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
                Description = "Если у вас осталась тыква, и вы не знаете что с ней сделать, то это решение для вас!",
                ImageUrl = "assets/images/recipe_of_day.png",
                CookingTimeInMinutes = 35,
                LikesCount = 365,
                Username = "@glazest"
            };
        }
    }
}