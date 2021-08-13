using System.Collections.Generic;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Dtos;
using RecipeBook.Application;
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

        public UserController( IUserRepository userRepository, IUnitOfWork unitOfWork )
        {
            _userRepository = userRepository;
            _unitOfWork = unitOfWork;
        }

        [HttpPost( "login" )]
        public AuthenticationResultDto Login( UserCommandDto userDto )
        {
            User user = _userRepository.GetByLogin( userDto.Login );
            if ( user != null )
            {
                if ( userDto.Password == user.Password )
                {
                    Authenticate( userDto.Login );
                    return new AuthenticationResultDto( true );
                }
            }

            return new AuthenticationResultDto( false ); // что-нибудь вместо этого придумаю (ещё один параметр)
        }

        [HttpPost( "register" )]
        public AuthenticationResultDto Register( UserCommandDto userCommandDto )
        {
            User user = _userRepository.GetByLogin( userCommandDto.Login );
            if ( user == null )
            {
                _userRepository.Add( new User { Login = userCommandDto.Login, Name = userCommandDto.Name, Password = userCommandDto.Password } );
                _unitOfWork.Commit();
                Authenticate( userCommandDto.Login );
                return new AuthenticationResultDto( true );
            }

            return new AuthenticationResultDto( false );
        }

        [HttpGet( "get-user" )]
        public DetailUserDto GetUser()
        {
            if ( User.Identity.Name == null ) return null;

            User user = _userRepository.GetByLogin( User.Identity.Name );
            return new DetailUserDto { Name = user.Name, Description = user.Description, Login = user.Login, Id = user.UserId };
        }

        private void Authenticate( string userName )
        {
            List<Claim> claims = new() { new Claim( ClaimsIdentity.DefaultNameClaimType, userName ) };
            ClaimsIdentity id = new(claims, "RecipeBookCookie", ClaimsIdentity.DefaultNameClaimType, ClaimsIdentity.DefaultRoleClaimType);
            HttpContext.SignInAsync( CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal( id ) ).Wait();
        }


        [HttpGet( "logout" )]
        public void Logout()
        {
            HttpContext.SignOutAsync( CookieAuthenticationDefaults.AuthenticationScheme ).Wait();
        }
    }
}
