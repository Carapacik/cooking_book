namespace RecipeBook.Application.Services.Entities
{
    public class SaveFileResult
    {
        public SaveFileResult(string relativeUri)
        {
            RelativeUri = relativeUri;
        }

        public string RelativeUri { get; }
    }
}