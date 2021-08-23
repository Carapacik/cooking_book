namespace RecipeBook.Application.Services
{
    public interface IRatingService
    {
        void AddToFavorites( string username, int recipeId );
        void RemoveFromFavorites( string username, int recipeId );
        void AddToLikes( string username, int recipeId );
        void RemoveFromLikes( string username, int recipeId );
    }
}
