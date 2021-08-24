using System.Threading.Tasks;
using RecipeBook.Application.Entities;

namespace RecipeBook.Application.Services
{
    public interface IUserService
    {
        Task<UserProfile> GetUserProfile( string username );
        Task<AuthenticationResult> Login( AuthenticateUserCommand authenticateUserCommand );
        Task<AuthenticationResult> Register( AuthenticateUserCommand result );
    }
}
