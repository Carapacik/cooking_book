using System.Collections.Generic;
using System.Linq;
using RecipeBook.Api.Dtos;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Api.Converters
{
    public class UserBuilder
    {
        private readonly IUserRepository _userRepository;

        public UserBuilder( IUserRepository userRepository )
        {
            _userRepository = userRepository;
        }

        public RecipeDetailDto AddUserNameToRecipeDetail( Recipe recipe )
        {
            User user = _userRepository.GetById( recipe.UserId );
            return recipe.ConvertToRecipeDetailDto( user.Login );
        }

        public RecipeOfDayDto AddUserNameToRecipeOfDay( Recipe recipe )
        {
            User user = _userRepository.GetById( recipe.UserId );
            return recipe.ConvertToRecipeOfDayDto( user.Login );
        }

        public List<RecipeDto> AddUserNameToRecipes( IEnumerable<Recipe> recipes )
        {
            return recipes.Select( x => x.ConvertToRecipeDto( _userRepository.GetById( x.UserId ).Login ) ).ToList();
        }
    }
}
