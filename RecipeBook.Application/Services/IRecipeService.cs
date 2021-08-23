using System.Collections.Generic;
using RecipeBook.Application.Entities;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Application.Services
{
    public interface IRecipeService
    {
        Recipe AddRecipe( RecipeCommand command );
        void DeleteRecipe( int id, string username );
        Recipe EditRecipe( RecipeCommand editCommand );
        IReadOnlyList<Recipe> GetFavoriteRecipes( int skip, int take, string username );
        IReadOnlyList<Recipe> GetUserOwnedRecipes( int skip, int take, string username );
    }
}
