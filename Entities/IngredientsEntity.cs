using System.Collections.Generic;

namespace RecipeBook.Entities
{
    public class IngredientsEntity
    {
        public string Id { get; set; }
        public string Title { get; set; }
        public List<string> Ingredients { get; set; }
    }
}