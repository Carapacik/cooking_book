using System;
using System.Threading.Tasks;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Application.Services
{
    public class RatingService : IRatingService
    {
        private readonly IRatingRepository _ratingRepository;
        private readonly IRecipeRepository _recipeRepository;
        private readonly IUserRepository _userRepository;

        public RatingService( IRecipeRepository recipeRepository, IRatingRepository ratingRepository, IUserRepository userRepository )
        {
            _recipeRepository = recipeRepository;
            _ratingRepository = ratingRepository;
            _userRepository = userRepository;
        }

        public async Task AddToFavorites( string username, int recipeId )
        {
            Recipe recipe = await _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id [{recipeId}] does not exist" );
            }

            User user = await _userRepository.GetByLogin( username );
            Rating rating = await _ratingRepository.Get( user.UserId, recipeId );
            if ( rating == null )
            {
                rating = new Rating( user.UserId, recipeId );
                _ratingRepository.Add( rating );
            }

            if ( rating.InFavorite )
            {
                return;
            }

            rating.InFavorite = true;
            rating.ModificationDateTime = DateTime.Now;
            recipe.FavoritesCount += 1;

            if ( rating.IsLiked )
            {
                return;
            }

            rating.IsLiked = true;
            recipe.LikesCount += 1;
        }

        public async Task RemoveFromFavorites( string username, int recipeId )
        {
            Recipe recipe = await _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id:{recipeId} does not exist" );
            }

            User user = await _userRepository.GetByLogin( username );
            Rating rating = await _ratingRepository.Get( user.UserId, recipeId );
            if ( rating == null )
            {
                return;
            }

            if ( !rating.InFavorite )
            {
                return;
            }

            rating.InFavorite = false;
            rating.ModificationDateTime = DateTime.Now;
            recipe.FavoritesCount -= 1;
        }

        public async Task AddToLikes( string username, int recipeId )
        {
            Recipe recipe = await _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id [{recipeId}] does not exist" );
            }

            User user = await _userRepository.GetByLogin( username );
            Rating rating = await _ratingRepository.Get( user.UserId, recipeId );
            if ( rating == null )
            {
                rating = new Rating( user.UserId, recipeId );
                _ratingRepository.Add( rating );
            }

            if ( rating.IsLiked )
            {
                return;
            }

            rating.IsLiked = true;
            recipe.LikesCount += 1;
        }

        public async Task RemoveFromLikes( string username, int recipeId )
        {
            Recipe recipe = await _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id [{recipeId}] does not exist" );
            }

            User user = await _userRepository.GetByLogin( username );
            Rating rating = await _ratingRepository.Get( user.UserId, recipeId );
            if ( rating == null )
            {
                return;
            }

            if ( !rating.IsLiked )
            {
                return;
            }

            rating.IsLiked = false;
            recipe.LikesCount -= 1;
        }
    }
}
