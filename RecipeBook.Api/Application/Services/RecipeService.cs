using System;
using Microsoft.AspNetCore.Http;

namespace RecipeBook.Api.Application.Services
{
    public class RecipeService : IRecipeService
    {
        public void AddRecipe()
        {
        }

        public void DeleteRecipe()
        {
            throw new NotImplementedException();
        }

        private void SaveFile(IFormFile formFile)
        {
        }
    }
}