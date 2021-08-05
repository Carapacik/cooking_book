using System.Collections.Generic;

namespace RecipeBook.Domain.Entities
{
    public class Ingredient
    {
        public int IngredientId { get; private set; }
        public string Title { get; set; }

        public int RecipeId { get; set; }

        public List<IngredientItem> IngredientItems { get; set; }
    }
}