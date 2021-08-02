using System;
using System.IO;
using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Repositories;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public class RecipeService : IRecipeService
    {
        private readonly IRecipeRepository _recipeRepository;
        private readonly StaticStorageSettings _staticStorageSettings;

        public RecipeService(IRecipeRepository recipeRepository, StaticStorageSettings staticStorageSettings)
        {
            _recipeRepository = recipeRepository;
            _staticStorageSettings = staticStorageSettings;
        }

        public void DeleteRecipe()
        {
        }

        public Recipe AddRecipe(AddRecipeCommand addCommand)
        {
            var imageResult = SaveFile(addCommand.FileAdapter, _staticStorageSettings.BasePath);
            var recipe = addCommand.Convert(imageResult);
            _recipeRepository.Add(recipe);

            return recipe;
        }

        private static SaveFileResult SaveFile(FormFileAdapter file, string basePath)
        {
            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $@"{basePath}\images\{fileName}";
            File.WriteAllBytes(newFilePath, file.Data);

            return new SaveFileResult($"{fileName}");
        }
    }
}