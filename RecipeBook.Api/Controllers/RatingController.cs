using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Application;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route( "api/[controller]" )]
    public class RatingController : Controller
    {
        private readonly IRatingRepository _ratingRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserRepository _userRepository;

        public RatingController( IUserRepository userRepository, IRatingRepository ratingRepository, IUnitOfWork unitOfWork )
        {
            _userRepository = userRepository;
            _ratingRepository = ratingRepository;
            _unitOfWork = unitOfWork;
        }

        [HttpGet( "{id:int}/favorite" )]
        [Authorize]
        public int Favorite( int id )
        {
            string username = User.Identity?.Name;
            User user = _userRepository.GetByLogin( username );
            int favoriteCount = _ratingRepository.UpdateFavorite( user.UserId, id );
            _unitOfWork.Commit();
            return favoriteCount;
        }

        [HttpGet( "{id:int}/like" )]
        [Authorize]
        public int Like( int id )
        {
            return 1;
        }
    }
}
