using System;
using System.IO;
using System.Linq;
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
            var imageResult = SaveFile(addCommand.FileAdapter, _staticStorageSettings.RecipeImagesPath);
            var recipe = addCommand.Convert(imageResult);
            _recipeRepository.Add(recipe);

            return recipe;
        }

        private static SaveImageResult SaveFile(FormFileAdapter file, string basePath)
        {
            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $@"{basePath}\{fileName}";
            using (var fs = File.Create(newFilePath))
            {
                fs.Write(file.Data);
            }

            var folderName = basePath.Split(@"\").Last();
            return new SaveImageResult($"{folderName}/{fileName}");
        }
    }
}