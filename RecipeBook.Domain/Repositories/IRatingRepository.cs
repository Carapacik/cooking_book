namespace RecipeBook.Domain.Repositories
{
    public interface IRatingRepository
    {
        int UpdateFavorite( int userUserId, int id );
    }
}
