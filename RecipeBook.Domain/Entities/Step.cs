namespace RecipeBook.Domain.Entities
{
    public class Step
    {
        public int StepId { get; private set; }
        public string Description { get; set; }

        public int RecipeId { get; set; }
    }
}