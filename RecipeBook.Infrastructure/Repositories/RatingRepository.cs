using System;
using System.Linq;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Infrastructure.Repositories
{
    public class RatingRepository : IRatingRepository
    {
        private readonly RecipeBookDbContext _context;
        private readonly IRecipeRepository _recipeRepository;

        public RatingRepository( RecipeBookDbContext context, IRecipeRepository recipeRepository )
        {
            _context = context;
            _recipeRepository = recipeRepository;
        }

        public int UpdateFavorite( int userId, int recipeId )
        {
            Rating rating = _context.Set<Rating>().FirstOrDefault( x => x.RecipeId == recipeId && x.UserId == userId );
            if ( rating == null )
            {
                _context.Set<Rating>().Add( new Rating
                {
                    UserId = userId, 
                    RecipeId = recipeId, 
                    InFavorite = true, 
                    IsLiked = true
                } );
            }
            else
            {
                rating.InFavorite = true;
                rating.IsLiked = true;
            }

            Recipe recipe = _recipeRepository.GetById( recipeId );
            if ( recipe == null ) throw new ArgumentException( "Recipe does not exist" );

            recipe.FavoritesCount += 1;
            recipe.LikesCount += 1;

            return recipe.FavoritesCount;
        }
    }
}
