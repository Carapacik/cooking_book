using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Application;
using RecipeBook.Application.Services;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route( "api/recipes/{recipeId:int}/rating" )]
    public class RatingController : Controller
    {
        private readonly IRatingService _ratingService;
        private readonly IUnitOfWork _unitOfWork;

        public RatingController( IUnitOfWork unitOfWork, IRatingService ratingService )
        {
            _unitOfWork = unitOfWork;
            _ratingService = ratingService;
        }

        [HttpPost( "add-to-favorites" )]
        [Authorize]
        public void AddToFavorites( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.AddToFavorites( username, recipeId );
            _unitOfWork.Commit();
        }

        [HttpPost( "remove-from-favorites" )]
        [Authorize]
        public void RemoveFromFavorites( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.RemoveFromFavorites( username, recipeId );
            _unitOfWork.Commit();
        }

        [HttpPost( "add-to-likes" )]
        [Authorize]
        public void AddToLikes( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.AddToLikes( username, recipeId );
            _unitOfWork.Commit();
        }

        [HttpPost( "remove-from-likes" )]
        [Authorize]
        public void RemoveFromLikes( int recipeId )
        {
            string username = User.Identity?.Name;
            _ratingService.RemoveFromLikes( username, recipeId );
            _unitOfWork.Commit();
        }
    }
}
