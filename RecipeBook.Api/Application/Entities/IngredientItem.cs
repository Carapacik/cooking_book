namespace RecipeBook.Api.Application.Entities
{
    public class IngredientItem
    {
        public int IngredientItemId { get; }
        public string Name { get; set; }

        public int IngredientId { get; set; }
    }
}