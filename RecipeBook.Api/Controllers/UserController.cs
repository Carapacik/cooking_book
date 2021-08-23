using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Converters;
using RecipeBook.Api.Dtos;
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
        private readonly IUserRepository _userRepository;
        private readonly IUserService _userService;

        public UserController( IUserRepository userRepository, IUserService userService )
        {
            _userRepository = userRepository;
            _userService = userService;
        }

        [HttpGet( "current-user" )]
        public DetailUserDto GetCurrentUser()
        {
            if ( User.Identity is { Name: null } )
            {
                return null;
            }

            User user = _userRepository.GetByLogin( User.Identity?.Name );
            return user.Convert();
        }

        [HttpPost( "login" )]
        public AuthenticationResultDto Login( AuthenticateUserCommandDto authenticateUserDto )
        {
            AuthenticateUserCommand authenticateUserCommand = ParseAuthenticateUserCommand( authenticateUserDto );
            AuthenticationResult result = _userService.Login( authenticateUserCommand );

            return new AuthenticationResultDto( result.Result, result.Error );
        }

        [HttpPost( "register" )]
        public AuthenticationResultDto Register( AuthenticateUserCommandDto authenticateUserDto )
        {
            AuthenticateUserCommand authenticateUserCommand = ParseAuthenticateUserCommand( authenticateUserDto );
            AuthenticationResult result = _userService.Register( authenticateUserCommand );

            return new AuthenticationResultDto( result.Result, result.Error );
        }

        [HttpPost( "logout" )]
        public void Logout()
        {
            HttpContext.SignOutAsync( CookieAuthenticationDefaults.AuthenticationScheme ).Wait();
        }

        [HttpGet( "profile" )]
        [Authorize]
        public ProfileDto GetProfile()
        {
            if ( User.Identity is { Name: null } )
            {
                return null;
            }

            ProfileResult result = _userService.GetProfileData( User.Identity?.Name );
            return new ProfileDto
            {
                RecipesCount = result.RecipesCount,
                FavoritesCount = result.FavoritesCount,
                LikesCount = result.LikesCount,
                UserForm = new UserFormDto
                {
                    Description = result.Description, Name = result.Name, Login = result.Login, Password = result.Password
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
