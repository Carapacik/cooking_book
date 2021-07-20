namespace RecipeBook.Api.Application.Entities
{
    public class Step
    {
        public int StepId { get; }
        public string Description { get; set; }

        public int RecipeId { get; set; }
    }
}