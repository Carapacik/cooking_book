using System.Collections.Generic;

namespace RecipeBook.Entities
{
    public class RecipeEntity
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public int CookingTime { get; set; }
        public int PortionsCount { get; set; }
        public List<string> Tags { get; set; }
        public List<StepEntity> Steps { get; set; }
        public List<IngredientsEntity> Ingredients { get; set; }
    }
}