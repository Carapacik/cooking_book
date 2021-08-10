using RecipeBook.Application.Services.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        Recipe AddRecipe( AddRecipeCommand addCommand );
        void DeleteRecipe( int id );
        Recipe EditRecipe( EditRecipeCommand editCommand );
    }
}
