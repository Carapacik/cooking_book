namespace RecipeBook.Api.Dtos
{
    public class RecipeOfDayDto
    {
        public int RecipeId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public int LikesCount { get; set; }
        public int CookingTimeInMinutes { get; set; }
        public string Username { get; set; }
    }
}
