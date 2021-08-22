namespace RecipeBook.Application.Services
{
    public interface IRatingService
    {
        void AddToFavorites( string username, int recipeId );
        void RemoveFromFavorites( string username, int recipeId );
        void AddToLiked( string username, int recipeId );
        void RemoveFromLiked( string username, int recipeId );
    }
}
