using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Api.Converters
{
    public static class StorageFileConverter
    {
        public static StorageFile ConvertToStorageFile(this FormFileAdapter fileAdapter)
        {
            return new StorageFile
            {
                Data = fileAdapter.Data,
                FileExtension = fileAdapter.FileExtension
            };
        }
    }
}