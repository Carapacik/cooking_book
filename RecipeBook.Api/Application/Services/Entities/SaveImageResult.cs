namespace RecipeBook.Api.Application.Services.Entities
{
    public class SaveImageResult
    {
        public SaveImageResult(string imageUri)
        {
            ImageUri = imageUri;
        }

        public string ImageUri { get; set; }
    }
}