using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Api.Converters
{
    public static class FileConverter
    {
        public static RecipeFile Convert(this FormFileAdapter fileAdapter)
        {
            return new RecipeFile
            {
                Data = fileAdapter.Data,
                FileExtension = fileAdapter.FileExtension
            };
        }
    }
}