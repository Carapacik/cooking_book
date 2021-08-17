using RecipeBook.Application.Entities;

namespace RecipeBook.Application.Services
{
    public interface IUserService
    {
        AuthenticationResult Login( UserCommand userCommand );
        AuthenticationResult Register( UserCommand authenticationResult );
    }
}
