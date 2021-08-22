namespace RecipeBook.Domain.Entities
{
    public class Rating
    {
        public Rating( int userId, int recipeId )
        {
            UserId = userId;
            RecipeId = recipeId;
        }

        public int UserId { get; set; }
        public int RecipeId { get; set; }
        public bool InFavorite { get; set; }
        public bool IsLiked { get; set; }
    }
}
