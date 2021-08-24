using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Converters;
using RecipeBook.Api.Dtos;
using RecipeBook.Application;
using RecipeBook.Application.Entities;
using RecipeBook.Application.Services;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route( "api/[controller]" )]
    public class UserController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserRepository _userRepository;
        private readonly IUserService _userService;

        public UserController( IUserRepository userRepository, IUserService userService, IUnitOfWork unitOfWork )
        {
            _userRepository = userRepository;
            _userService = userService;
            _unitOfWork = unitOfWork;
        }

        [HttpGet( "current-user" )]
        public async Task<DetailUserDto> GetCurrentUser()
        {
            if ( User.Identity is { Name: null } )
            {
                return null;
            }

            User user = await _userRepository.GetByLogin( User.Identity?.Name );
            return user.Convert();
        }

        [HttpPost( "login" )]
        public async Task<AuthenticationResultDto> Login( AuthenticateUserCommandDto authenticateUserDto )
        {
            AuthenticateUserCommand authenticateUserCommand = ParseAuthenticateUserCommand( authenticateUserDto );
            AuthenticationResult result = await _userService.Login( authenticateUserCommand );

            return new AuthenticationResultDto( result.Result, result.Error );
        }

        [HttpPost( "register" )]
        public async Task<AuthenticationResultDto> Register( AuthenticateUserCommandDto authenticateUserDto )
        {
            AuthenticateUserCommand authenticateUserCommand = ParseAuthenticateUserCommand( authenticateUserDto );
            AuthenticationResult result = await _userService.Register( authenticateUserCommand );

            await _unitOfWork.Commit();

            return new AuthenticationResultDto( result.Result, result.Error );
        }

        [HttpPost( "logout" )]
        public async Task Logout()
        {
            await HttpContext.SignOutAsync( CookieAuthenticationDefaults.AuthenticationScheme );
        }

        [HttpGet( "profile" )]
        [Authorize]
        public async Task<ProfileDto> GetProfile()
        {
            UserProfile result = await _userService.GetUserProfile( User.Identity?.Name );
            return new ProfileDto
            {
                RecipesCount = result.RecipesCount,
                FavoritesCount = result.FavoritesCount,
                LikesCount = result.LikesCount,
                UserForm = new UserFormDto
                {
                    Description = result.Description,
                    Name = result.Name,
                    Login = result.Login,
                    Password = result.Password
                }
            };
        }

        private AuthenticateUserCommand ParseAuthenticateUserCommand( AuthenticateUserCommandDto authenticateUserCommandDto )
        {
            return new AuthenticateUserCommand(
                authenticateUserCommandDto.Name,
                authenticateUserCommandDto.Login,
                authenticateUserCommandDto.Password,
                HttpContext );
        }
    }
}
