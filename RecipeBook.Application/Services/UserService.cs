using System.Collections.Generic;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using RecipeBook.Application.Entities;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Application.Services
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserRepository _userRepository;

        public UserService( IUserRepository userRepository, IUnitOfWork unitOfWork )
        {
            _userRepository = userRepository;
            _unitOfWork = unitOfWork;
        }


        public AuthenticationResult Login( UserCommand userCommand )
        {
            User user = _userRepository.GetByLogin( userCommand.Login );
            if ( user == null )
            {
                return new AuthenticationResult( false, "user" );
            }

            if ( userCommand.Password != user.Password )
            {
                return new AuthenticationResult( false, "password" );
            }

            Authenticate( userCommand.Login, userCommand.HttpContext );
            return new AuthenticationResult( true, null );
        }

        public AuthenticationResult Register( UserCommand userCommand )
        {
            User user = _userRepository.GetByLogin( userCommand.Login );
            if ( user != null )
            {
                return new AuthenticationResult( false, "user" );
            }

            _userRepository.Add( new User { Login = userCommand.Login, Name = userCommand.Name, Password = userCommand.Password } );
            _unitOfWork.Commit();
            Authenticate( userCommand.Login, userCommand.HttpContext );
            return new AuthenticationResult( true, null );
        }

        private static void Authenticate( string userName, HttpContext httpContext )
        {
            List<Claim> claims = new() { new Claim( ClaimsIdentity.DefaultNameClaimType, userName ) };
            ClaimsIdentity id = new(claims, "RecipeBookCookie", ClaimsIdentity.DefaultNameClaimType, ClaimsIdentity.DefaultRoleClaimType);
            httpContext.SignInAsync( CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal( id ) ).Wait();
        }
    }
}
