using System;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;
using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Dtos;

namespace RecipeBook.Api.Application.Services
{
    public class RecipeService : IRecipeService
    {
        public void AddRecipe(AddRecipeCommandDto addRecipeCommand, IFormFile formFile)
        {
            var file = FormFileConverter.Create(formFile);
            var filePath = SaveFile(file);
            addRecipeCommand.ImageUrl = filePath;
        }

        public void DeleteRecipe()
        {
            //
        }

        private static string SaveFile(FormFileConverter file)
        {
            const string basePath = "D:\\recipebook-static\\images";
            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $@"{basePath}\{fileName}";
            using (var fs = File.Create(newFilePath))
            {
                fs.WriteAsync(file.Data);
            }

            var folderName = basePath.Split(@"\").Last();
            return $@"{folderName}/{fileName}";
        }
    }
}