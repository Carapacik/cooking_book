using System.Collections.Generic;

namespace RecipeBook.Api.Application.Dtos
{
    public class IngredientDto
    {
        public string Title { get; set; }
        public List<string> IngredientNames { get; set; }
    }
}