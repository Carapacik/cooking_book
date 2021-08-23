using RecipeBook.Api.Dtos;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Api.Converters
{
    public static class UserConverter
    {
        public static DetailUserDto Convert( this User user )
        {
            return new DetailUserDto { Id = user.UserId, Name = user.Name, Login = user.Login };
        }
    }
}
