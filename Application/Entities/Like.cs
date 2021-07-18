namespace RecipeBook.Application.Entities
{
    public class Like
    {
        public int LikeId { get; set; }

        public int RecipeId { get; set; }
        public int UserId { get; set; }
    }
}