using System.Collections.Generic;

namespace RecipeBook.Api.Dtos
{
    public class RecipeDetailDto
    {
        public int RecipeId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public int CookingTimeInMinutes { get; set; }
        public int PortionsCount { get; set; }
        public int LikesCount { get; set; }
        public int FavoritesCount { get; set; }
        public string Username { get; set; }
        public bool IsLiked { get; set; }
        public bool IsFavorite { get; set; }
        public List<string> Tags { get; set; }
        public List<string> Steps { get; set; }
        public List<IngredientDto> Ingredients { get; set; }
    }
}
