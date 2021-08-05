using System.Collections.Generic;

namespace RecipeBook.Application.Dtos
{
    public class AddRecipeCommandDto
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public int CookingTimeInMinutes { get; set; }
        public int PortionsCount { get; set; }
        public List<string> Tags { get; set; }
        public List<string> Steps { get; set; }
        public List<IngredientDto> Ingredients { get; set; }
    }
}