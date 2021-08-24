using System.Collections.Generic;
using System.Threading.Tasks;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IRatingRepository
    {
        void Add( Rating rating );
        Task<Rating> Get( int userId, int recipeId );
        Task<IReadOnlyList<Rating>> Get( int userId, List<int> recipeIds );
        Task<IReadOnlyList<Rating>> GetInFavoriteByUserId( int userId );
        Task<int> GetUserLikesCountByUserId( int userId );
        Task<int> GetUserFavoritesCountByUserId( int userId );
    }
}
