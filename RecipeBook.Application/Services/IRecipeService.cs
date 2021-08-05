using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        void DeleteRecipe();
        Recipe AddRecipe(AddRecipeCommand addCommand);
    }
}