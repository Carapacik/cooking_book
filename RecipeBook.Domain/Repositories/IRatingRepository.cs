using System.Collections.Generic;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IRatingRepository
    {
        void Add( Rating rating );
        Rating Get( int userId, int recipeId );
        IEnumerable<Rating> Get( int userId, List<int> recipeIds );
        IEnumerable<Rating> GetInFavoriteByUserId( int userId );
        List<Rating> GetInUserOwnedByUserId( int userId );
    }
}
