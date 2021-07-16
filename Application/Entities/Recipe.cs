using System.Collections.Generic;

namespace RecipeBook.Application.Entities
{
    public class Recipe
    {
        public long RecipeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public int CookingTimeInMinutes { get; set; }
        public int PortionsCount { get; set; }
        public List<Tag> Tags { get; set; }
        public List<Step> Steps { get; set; }
        public List<Ingredient> Ingredients { get; set; }

        public long UserId { get; set; }
    }
}