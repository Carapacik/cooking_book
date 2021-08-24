using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Infrastructure.Repositories
{
    public class RatingRepository : IRatingRepository
    {
        private readonly RecipeBookDbContext _context;

        public RatingRepository( RecipeBookDbContext context )
        {
            _context = context;
        }

        public void Add( Rating rating )
        {
            _context.Set<Rating>().Add( rating );
        }

        public async Task<Rating> Get( int userId, int recipeId )
        {
            return await _context.Set<Rating>().FirstOrDefaultAsync( x => x.UserId == userId && x.RecipeId == recipeId );
        }

        public async Task<IReadOnlyList<Rating>> Get( int userId, List<int> recipeIds )
        {
            return await _context.Set<Rating>().Where( x => x.UserId == userId && recipeIds.Contains( x.RecipeId ) ).ToListAsync();
        }

        public async Task<IReadOnlyList<Rating>> GetInFavoriteByUserId( int userId )
        {
            return await _context.Set<Rating>()
                .Where( x => x.UserId == userId && x.InFavorite )
                .OrderByDescending( x => x.ModificationDateTime )
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Rating>> GetInUserOwnedByUserId( int userId )
        {
            return await _context.Set<Rating>()
                .Where( x => x.UserId == userId )
                .OrderByDescending( x => x.ModificationDateTime )
                .ToListAsync();
        }

        public async Task<int> GetUserLikesCountByUserId( int userId )
        {
            return await _context.Set<Rating>().CountAsync( x => x.UserId == userId && x.IsLiked );
        }

        public async Task<int> GetUserFavoritesCountByUserId( int userId )
        {
            return await _context.Set<Rating>().CountAsync( x => x.UserId == userId && x.InFavorite );
        }
    }
}
