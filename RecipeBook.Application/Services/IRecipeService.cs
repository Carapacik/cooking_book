using RecipeBook.Application.Services.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        Recipe AddRecipe( RecipeCommand command, string identityName );
        void DeleteRecipe( int id );
        Recipe EditRecipe( RecipeCommand command, string identityName );
    }
}
