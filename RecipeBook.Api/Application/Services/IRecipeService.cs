using RecipeBook.Api.Application.Entities;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public interface IRecipeService
    {
        void DeleteRecipe();
        Recipe AddRecipe(AddRecipeCommand addCommand);
    }
}