using RecipeBook.Api.Dtos;
using RecipeBook.Application.Entities;

namespace RecipeBook.Api.Converters
{
    public static class ProfileCommandConverter
    {
        public static ProfileCommand Convert( this ProfileCommandDto profileCommand )
        {
            return new ProfileCommand();
        }
    }
}
