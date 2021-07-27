using System;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
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

        private IConfiguration _configuration { get; }

        [HttpPost]
        [DisableRequestSizeLimit]
        public int AddRecipe()
        {
            var imageFile = Request.Form.Files[0];
            var addCommandDto = JsonConvert.DeserializeObject<AddRecipeCommandDto>(Request.Form["recipe"]);

            // сохранение картинки

            addCommandDto.ImageUrl = UploadFile(imageFile);
            var newRecipe = addCommandDto.Convert();

            _recipeRepository.Add(newRecipe);
            _unitOfWork.Commit();

            return newRecipe.RecipeId;
        }

        private string UploadFile(IFormFile imageFile)
        {
            var file = FormFileConverter.Create(imageFile);
            return SaveFile(file);
        }

        private string SaveFile(FormFileConverter file)
        {
            var defaultPath = "D:\\recipebook-static\\images"; // Как получить путь с appsettings?

            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $@"{defaultPath}\{fileName}";
            using (FileStream fs = File.Create(newFilePath)) // что такое File.Create
            {
                fs.WriteAsync(file.Data);
            }

            var folderName = defaultPath.Split(@"\").Last();
            return $@"{folderName}/{fileName}";
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