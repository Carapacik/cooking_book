using System.Collections.Generic;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IRecipeRepository
    {
        void Add( Recipe recipe );
        void Delete( int id );
        void Edit( Recipe recipe );
        Recipe GetById( int id );
        Recipe GetRecipeOfDay();
        IReadOnlyList<Recipe> Search( int skip, int take, string searchQuery );
    }
}
