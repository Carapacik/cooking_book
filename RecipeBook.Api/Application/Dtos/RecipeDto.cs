using System.Collections.Generic;

namespace RecipeBook.Api.Application.Dtos
{
    public class RecipeDto
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
        public List<string> Tags { get; set; }
    }
}