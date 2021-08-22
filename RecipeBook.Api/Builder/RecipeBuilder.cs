using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using RecipeBook.Api.Converters;
using RecipeBook.Api.Dtos;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Api.Builder
{
    public class RecipeBuilder
    {
        private readonly IRatingRepository _ratingRepository;
        private readonly IUserRepository _userRepository;

        public RecipeBuilder( IUserRepository userRepository, IRatingRepository ratingRepository )
        {
            _userRepository = userRepository;
            _ratingRepository = ratingRepository;
        }

        public RecipeDetailDto BuildRecipeDetail( Recipe recipe, string username )
        {
            Rating rating = GetRating( username, recipe.RecipeId );
            User author = _userRepository.GetById( recipe.UserId );
            return recipe.ConvertToRecipeDetailDto( author?.Login, rating );
        }

        public RecipeOfDayDto BuildRecipeOfDay( Recipe recipe )
        {
            User author = _userRepository.GetById( recipe.UserId );
            return recipe.ConvertToRecipeOfDayDto( author?.Login );
        }

        public List<RecipeDto> BuildRecipes( IReadOnlyList<Recipe> recipes, string username )
        {
            if ( username == null ) { throw new ValidationException( "User is null" ); }

            List<int> recipeIds = recipes.Select( x => x.RecipeId ).Distinct().ToList();
            User user = _userRepository.GetByLogin( username );
            Dictionary<int, Rating> ratingByRecipeId = _ratingRepository.Get( user.UserId, recipeIds ).ToDictionary( x => x.RecipeId );
            List<int> authorIds = recipes.Select( x => x.UserId ).Distinct().ToList();
            Dictionary<int, User> authorByUserId = _userRepository.GetByIds( authorIds ).ToDictionary( x => x.UserId );

            return recipes.Select( x =>
            {
                Rating rating = ratingByRecipeId.GetValueOrDefault( x.RecipeId );
                User author = authorByUserId.GetValueOrDefault( x.UserId );
                return x.ConvertToRecipeDto( author?.Login, rating );
            } ).ToList();
        }

        private Rating GetRating( string username, int recipeId )
        {
            User user = _userRepository.GetByLogin( username );
            Rating rating = null;
            if ( user != null )
            {
                rating = _ratingRepository.Get( user.UserId, recipeId );
            }

            return rating;
        }
    }
}
