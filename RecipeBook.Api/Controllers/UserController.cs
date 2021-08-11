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
        public AuthenticationResultDto Login( UserDto userDto )
        {
            User user = _userRepository.GetByLogin( userDto.Login );
            if ( user != null )
            {
                Authenticate( userDto.Login );
                return new AuthenticationResultDto( true );
            }

            return new AuthenticationResultDto( false );
        }

        [HttpPost( "register" )]
        public AuthenticationResultDto Register( UserDto userDto )
        {
            User user = _userRepository.GetByLogin( userDto.Login );
            if ( user == null )
            {
                _userRepository.Add( new User { Login = userDto.Login, Name = userDto.Name, Password = userDto.Password } );
                _unitOfWork.Commit();
                Authenticate( userDto.Login );
                return new AuthenticationResultDto( true );
            }

            return new AuthenticationResultDto( false );
        }

        private void Authenticate( string userName )
        {
            List<Claim> claims = new() { new Claim( ClaimsIdentity.DefaultNameClaimType, userName ) };
            ClaimsIdentity id = new(claims, "ApplicationCookie", ClaimsIdentity.DefaultNameClaimType, ClaimsIdentity.DefaultRoleClaimType);
            // установка аутентификационных куки
            HttpContext.SignInAsync( CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal( id ) ).Wait();
        }
    }
}
