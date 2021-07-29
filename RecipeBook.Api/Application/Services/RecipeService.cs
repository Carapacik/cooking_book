using System;
using System.IO;
using System.Linq;
using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Repositories;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public class RecipeService : IRecipeService
    {
        private readonly IRecipeRepository _recipeRepository;

        public RecipeService(IRecipeRepository recipeRepository)
        {
            _recipeRepository = recipeRepository;
        }

        public void DeleteRecipe()
        {
        }

        public Recipe AddRecipe(FormFileAdapter adaptedFile, AddRecipeCommandDto addCommandDto)
        {
            var saveImageResult = new SaveImageResult
            {
                ImageUri = SaveFile(adaptedFile)
            };
            addCommandDto.ImageUrl = saveImageResult.ImageUri;
            
            var recipe =  addCommandDto.Convert();
            _recipeRepository.Add(recipe);
            
            return recipe;
        }

        private static string SaveFile(FormFileAdapter file)
        {
            const string basePath = "D:\\recipebook-static\\images";
            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $@"{basePath}\{fileName}";
            using (var fs = File.Create(newFilePath))
            {
                fs.Write(file.Data);
            }

            var folderName = basePath.Split(@"\").Last();
            return $@"{folderName}/{fileName}";
        }
    }
}