using System.Threading.Tasks;

namespace RecipeBook.Application.Services
{
    public interface IRatingService
    {
        Task AddToFavorites( string username, int recipeId );
        Task RemoveFromFavorites( string username, int recipeId );
        Task AddToLikes( string username, int recipeId );
        Task RemoveFromLikes( string username, int recipeId );
    }
}
