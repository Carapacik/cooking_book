using System.Collections.Generic;

namespace RecipeBook.Api.Dtos
{
    public class IngredientDto
    {
        public string Title { get; set; }
        public List<string> IngredientNames { get; set; }
    }
}
