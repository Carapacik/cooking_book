namespace RecipeBook.Api.Application.Entities
{
    public class IngredientItem
    {
        public int IngredientItemId { get; private set; }
        public string Name { get; set; }

        public int IngredientId { get; set; }
    }
}