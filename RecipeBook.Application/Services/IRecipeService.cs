using RecipeBook.Application.Services.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        Recipe AddRecipe( RecipeCommand command );
        void DeleteRecipe( int id );
        Recipe EditRecipe( RecipeCommand command );
    }
}
