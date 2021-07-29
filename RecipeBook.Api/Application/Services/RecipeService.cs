using System;
using System.IO;
using System.Linq;
using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public class RecipeService : IRecipeService
    {
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
            return addCommandDto.Convert();
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