namespace RecipeBook.Domain.Entities
{
    public class UserRating
    {
        public int RecipeId { get; set; }
        public int UserId { get; set; }
        public bool InFavorite { get; set; }
        public bool IsLiked { get; set; }
    }
}
