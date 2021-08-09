using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Application.Services
{
    public interface IFileStorageService
    {
        GetFileResult GetFile(string path);
        SaveFileResult SaveFile(StorageFile file, string path);
    }
}