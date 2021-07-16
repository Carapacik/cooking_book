using System.Collections.Generic;

namespace RecipeBook.Application.Entities
{
    public class Ingredient
    {
        public string IngredientId { get; set; }
        public string Title { get; set; }
        public List<IngredientItem> IngredientItems { get; set; }

        public long RecipeId { get; set; }
    }
}