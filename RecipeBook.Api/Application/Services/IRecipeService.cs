using Microsoft.AspNetCore.Http;
using RecipeBook.Api.Application.Dtos;

namespace RecipeBook.Api.Application.Services
{
    public interface IRecipeService
    {
        void AddRecipe(AddRecipeCommandDto addRecipeCommand, IFormFile formFile);
        void DeleteRecipe();
    }
}