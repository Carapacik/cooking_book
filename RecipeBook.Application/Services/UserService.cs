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
        private readonly IRatingRepository _ratingRepository;
        private readonly IRecipeRepository _recipeRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserRepository _userRepository;

        public UserService(
            IUserRepository userRepository,
            IUnitOfWork unitOfWork,
            IRatingRepository ratingRepository,
            IRecipeRepository recipeRepository )
        {
            _userRepository = userRepository;
            _unitOfWork = unitOfWork;
            _ratingRepository = ratingRepository;
            _recipeRepository = recipeRepository;
        }


        public AuthenticationResult Login( AuthenticateUserCommand authenticateUserCommand )
        {
            User user = _userRepository.GetByLogin( authenticateUserCommand.Login );
            if ( user == null )
            {
                return new AuthenticationResult( false, "user" );
            }

            if ( authenticateUserCommand.Password != user.Password )
            {
                return new AuthenticationResult( false, "password" );
            }

            Authenticate( authenticateUserCommand.Login, authenticateUserCommand.HttpContext );
            return new AuthenticationResult( true, null );
        }

        public AuthenticationResult Register( AuthenticateUserCommand authenticateUserCommand )
        {
            User user = _userRepository.GetByLogin( authenticateUserCommand.Login );
            if ( user != null )
            {
                return new AuthenticationResult( false, "user" );
            }

            _userRepository.Add( new User
            {
                Login = authenticateUserCommand.Login, Name = authenticateUserCommand.Name, Password = authenticateUserCommand.Password
            } );
            _unitOfWork.Commit();
            Authenticate( authenticateUserCommand.Login, authenticateUserCommand.HttpContext );
            return new AuthenticationResult( true, null );
        }

        public UserProfile GetUserProfile( string username )
        {
            User user = _userRepository.GetByLogin( username );
            int favoritesCount = _ratingRepository.GetUserFavoritesCountByUserId( user.UserId );
            int likesCount = _ratingRepository.GetUserLikesCountByUserId( user.UserId );
            int recipesCount = _recipeRepository.GetUserRecipesCountByUserId( user.UserId );
            return new UserProfile
            {
                RecipesCount = recipesCount,
                FavoritesCount = favoritesCount,
                LikesCount = likesCount,
                Name = user.Name,
                Description = user.Description,
                Login = user.Login,
                Password = user.Password
            };
        }

        private static void Authenticate( string userName, HttpContext httpContext )
        {
            List<Claim> claims = new() { new Claim( ClaimsIdentity.DefaultNameClaimType, userName ) };
            ClaimsIdentity id = new(claims, "RecipeBookCookie", ClaimsIdentity.DefaultNameClaimType, ClaimsIdentity.DefaultRoleClaimType);
            httpContext.SignInAsync( CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal( id ) ).Wait();
        }
    }
}
