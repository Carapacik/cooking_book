using RecipeBook.Application.Entities;

namespace RecipeBook.Application.Services
{
    public interface IUserService
    {
        AuthenticationResult Login( AuthenticateUserCommand authenticateUserCommand );
        AuthenticationResult Register( AuthenticateUserCommand result );
        UserProfile GetUserProfile( string username );
    }
}
