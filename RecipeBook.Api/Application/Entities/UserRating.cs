namespace RecipeBook.Api.Application.Entities
{
    public class UserRating
    {
        public int UserRatingId { get; set; }
        public bool InFavorite { get; set; }
        public bool IsLiked { get; set; }

        public int RecipeId { get; set; }
        public int UserId { get; set; }
    }
}