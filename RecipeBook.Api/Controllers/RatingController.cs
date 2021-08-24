using System.Threading.Tasks;
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
        public async Task AddToFavorites( int recipeId )
        {
            string username = User.Identity?.Name;
            await _ratingService.AddToFavorites( username, recipeId );
            await _unitOfWork.Commit();
        }

        [HttpPost( "remove-from-favorites" )]
        [Authorize]
        public async Task RemoveFromFavorites( int recipeId )
        {
            string username = User.Identity?.Name;
            await _ratingService.RemoveFromFavorites( username, recipeId );
            await _unitOfWork.Commit();
        }

        [HttpPost( "add-to-likes" )]
        [Authorize]
        public async Task AddToLikes( int recipeId )
        {
            string username = User.Identity?.Name;
            await _ratingService.AddToLikes( username, recipeId );
            await _unitOfWork.Commit();
        }

        [HttpPost( "remove-from-likes" )]
        [Authorize]
        public async Task RemoveFromLikes( int recipeId )
        {
            string username = User.Identity?.Name;
            await _ratingService.RemoveFromLikes( username, recipeId );
            await _unitOfWork.Commit();
        }
    }
}
