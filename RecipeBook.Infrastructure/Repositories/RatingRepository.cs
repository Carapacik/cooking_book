using System.Collections.Generic;
using System.Linq;
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

        public Rating Get( int userId, int recipeId )
        {
            return _context.Set<Rating>().FirstOrDefault( x => x.UserId == userId && x.RecipeId == recipeId );
        }

        public IEnumerable<Rating> Get( int userId, List<int> recipeIds )
        {
            return _context.Set<Rating>().Where( x => x.UserId == userId && recipeIds.Contains( x.RecipeId ) ).ToList();
        }

        public IEnumerable<Rating> GetInFavoriteByUserId( int userId )
        {
            return _context.Set<Rating>().Where( x => x.UserId == userId && x.InFavorite ).ToList();
        }

        public List<Rating> GetInUserOwnedByUserId( int userId )
        {
            return _context.Set<Rating>().Where( x => x.UserId == userId ).ToList();
        }
    }
}
