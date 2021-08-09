using RecipeBook.Application.Services.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        void DeleteRecipe();
        Recipe AddRecipe(AddRecipeCommand addCommand);
    }
}