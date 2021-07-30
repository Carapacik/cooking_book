namespace RecipeBook.Api.Application.Services.Entities
{
    public class StorageSettings
    {
        public StorageSettings(string imagePath)
        {
            ImagePath = imagePath;
        }

        public string ImagePath { get; set; }
    }
}