namespace RecipeBook.Application.Entities
{
    public class Step
    {
        public long StepId { get; set; }
        public string Description { get; set; }

        public long RecipeId { get; set; }
    }
}