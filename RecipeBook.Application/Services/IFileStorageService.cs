using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Application.Services
{
    public interface IFileStorageService
    {
        GetFileResult GetFile( string path );
        void RemoveFile( string path, string fileName );
        SaveFileResult SaveFile( StorageFile file, string path );
    }
}
