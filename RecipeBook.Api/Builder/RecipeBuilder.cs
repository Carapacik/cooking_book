using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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

        public async Task<RecipeDetailDto> BuildRecipeDetail( Recipe recipe, string username )
        {
            Rating rating = await GetRating( username, recipe.RecipeId );
            User author = await _userRepository.GetById( recipe.UserId );
            return recipe.ConvertToRecipeDetailDto( author?.Login, rating );
        }

        public async Task<RecipeOfDayDto> BuildRecipeOfDay( Recipe recipe )
        {
            User author = await _userRepository.GetById( recipe.UserId );
            return recipe.ConvertToRecipeOfDayDto( author?.Login );
        }

        public async Task<List<RecipeDto>> BuildRecipes( IReadOnlyList<Recipe> recipes, string username )
        {
            List<int> authorIds = recipes.Select( x => x.UserId ).Distinct().ToList();
            IReadOnlyList<User> authors = await _userRepository.GetByIds( authorIds );
            Dictionary<int, User> authorByUserIdDictionary = authors.ToDictionary( x => x.UserId );

            Dictionary<int, Rating> ratingByRecipeId = new();
            Rating rating;
            if ( username != null )
            {
                List<int> recipeIds = recipes.Select( x => x.RecipeId ).Distinct().ToList();
                User user = await _userRepository.GetByLogin( username );
                IReadOnlyList<Rating> ratings = await _ratingRepository.Get( user.UserId, recipeIds );
                ratingByRecipeId = ratings.ToDictionary( x => x.RecipeId );
            }

            return recipes.Select( x =>
            {
                rating = ratingByRecipeId.GetValueOrDefault( x.RecipeId );
                User author = authorByUserIdDictionary.GetValueOrDefault( x.UserId );
                return x.ConvertToRecipeDto( author?.Login, rating );
            } ).ToList();
        }

        private async Task<Rating> GetRating( string username, int recipeId )
        {
            User user = await _userRepository.GetByLogin( username );
            Rating rating = null;
            if ( user != null )
            {
                rating = await _ratingRepository.Get( user.UserId, recipeId );
            }

            return rating;
        }
    }
}
