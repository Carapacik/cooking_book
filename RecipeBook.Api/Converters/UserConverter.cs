using RecipeBook.Api.Dtos;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Api.Converters
{
    public static class UserConverter
    {
        public static UserDto Convert( this User user )
        {
            return new UserDto { Name = user.Name, Login = user.Login };
        }
    }
}
