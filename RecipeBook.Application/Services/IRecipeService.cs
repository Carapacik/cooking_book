using RecipeBook.Application.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        Recipe AddRecipe( RecipeCommand command );
        void DeleteRecipe( int id, string username );
        Recipe EditRecipe( RecipeCommand editCommand );
    }
}
