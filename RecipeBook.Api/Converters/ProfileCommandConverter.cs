using RecipeBook.Api.Dtos;
using RecipeBook.Application.Entities;

namespace RecipeBook.Api.Converters
{
    public static class ProfileCommandConverter
    {
        public static ProfileCommand Convert( this ProfileCommandDto profileCommand, string username )
        {
            return new ProfileCommand
            {
                Password = profileCommand.Password,
                Description = profileCommand.Description,
                Login = profileCommand.Login,
                OldLogin = username,
                Name = profileCommand.Name
            };
        }
    }
}
