namespace RecipeBook.Api.Dtos
{
    public class ProfileDto
    {
        public int RecipesCount { get; set; }
        public int LikesCount { get; set; }
        public int FavoritesCount { get; set; }
        public UserFormDto UserFormDto { get; set; }
    }
}
