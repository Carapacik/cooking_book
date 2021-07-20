using System.Collections.Generic;

namespace RecipeBook.Api.Application.Entities
{
    public class Ingredient
    {
        public int IngredientId { get; }
        public string Title { get; set; }

        public int RecipeId { get; set; }

        public List<IngredientItem> IngredientItems { get; set; }
    }
}