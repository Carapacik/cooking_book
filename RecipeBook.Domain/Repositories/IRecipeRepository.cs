using System.Collections.Generic;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IRecipeRepository
    {
        void Add( Recipe recipe );
        void Delete( int id );
        void Edit( Recipe existingRecipe, Recipe editedRecipe );
        Recipe GetById( int id );
        IReadOnlyList<Recipe> GetFavoriteRecipes( int skip, int take, string username );
        IReadOnlyList<Recipe> GetUserOwnedRecipes( int skip, int take, string username );
        Recipe GetRecipeOfDay();
        IReadOnlyList<Recipe> Search( int skip, int take, string searchQuery );
    }
}
