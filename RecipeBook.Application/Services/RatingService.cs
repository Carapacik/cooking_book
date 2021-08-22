using System;
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

        public void AddToFavorites( string username, int recipeId )
        {
            Recipe recipe = _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id [{recipeId}] does not exist" );
            }

            int userId = _userRepository.GetByLogin( username ).UserId;
            Rating rating = _ratingRepository.Get( userId, recipeId );
            if ( rating == null )
            {
                rating = new Rating( userId, recipeId );
                _ratingRepository.Add( rating );
            }

            if ( rating.InFavorite )
            {
                return;
            }

            rating.InFavorite = true;
            recipe.FavoritesCount += 1;

            if ( rating.IsLiked )
            {
                return;
            }

            rating.IsLiked = true;
            recipe.LikesCount += 1;
        }

        public void RemoveFromFavorites( string username, int recipeId )
        {
            Recipe recipe = _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id [{recipeId}] does not exist" );
            }

            int userId = _userRepository.GetByLogin( username ).UserId;
            Rating rating = _ratingRepository.Get( userId, recipeId );
            if ( rating == null )
            {
                return;
            }

            if ( !rating.InFavorite )
            {
                return;
            }

            rating.InFavorite = false;
            recipe.FavoritesCount -= 1;
        }

        public void AddToLiked( string username, int recipeId )
        {
            Recipe recipe = _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id [{recipeId}] does not exist" );
            }

            int userId = _userRepository.GetByLogin( username ).UserId;
            Rating rating = _ratingRepository.Get( userId, recipeId );
            if ( rating == null )
            {
                rating = new Rating( userId, recipeId );
                _ratingRepository.Add( rating );
            }

            if ( rating.IsLiked )
            {
                return;
            }

            rating.IsLiked = true;
            recipe.LikesCount += 1;
        }

        public void RemoveFromLiked( string username, int recipeId )
        {
            Recipe recipe = _recipeRepository.GetById( recipeId );
            if ( recipe == null )
            {
                throw new ArgumentException( $"Recipe with id [{recipeId}] does not exist" );
            }

            int userId = _userRepository.GetByLogin( username ).UserId;
            Rating rating = _ratingRepository.Get( userId, recipeId );
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
