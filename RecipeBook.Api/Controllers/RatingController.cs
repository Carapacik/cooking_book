using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Application;
using RecipeBook.Application.Services;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route( "api/[controller]/{recipeId:int}" )]
    public class RatingController : Controller
    {
        private readonly IRatingService _ratingService;
        private readonly IUnitOfWork _unitOfWork;

        public RatingController( IUnitOfWork unitOfWork, IRatingService ratingService )
        {
            _unitOfWork = unitOfWork;
            _ratingService = ratingService;
        }

        [HttpPost( "add-favorite" )]
        [Authorize]
        public void AddFavorite( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.AddToFavorites( username, recipeId );
            _unitOfWork.Commit();
        }

        [HttpPost( "remove-favorite" )]
        [Authorize]
        public void RemoveFavorite( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.RemoveFromFavorites( username, recipeId );
            _unitOfWork.Commit();
        }

        [HttpPost( "add-like" )]
        [Authorize]
        public void AddLike( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.AddToLiked( username, recipeId );
            _unitOfWork.Commit();
        }

        [HttpPost( "remove-like" )]
        [Authorize]
        public void RemoveLike( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.RemoveFromLiked( username, recipeId );
            _unitOfWork.Commit();
        }
    }
}
