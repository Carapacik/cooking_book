namespace RecipeBook.Domain.Entities
{
    public class UserRating
    {
        public int RecipeId { get; private set; }
        public int UserId { get; }
        public bool InFavorite { get; set; }
        public bool IsLiked { get; set; }
    }
}