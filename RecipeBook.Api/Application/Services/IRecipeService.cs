using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Dtos;
using RecipeBook.Api.Application.Entities;

namespace RecipeBook.Api.Application.Services
{
    public interface IRecipeService
    {
        void DeleteRecipe();
        Recipe AddRecipe(FormFileAdapter adaptedFile, AddRecipeCommandDto addCommandDto);
    }
}