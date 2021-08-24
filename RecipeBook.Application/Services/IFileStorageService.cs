using System.Threading.Tasks;
using RecipeBook.Application.Entities;

namespace RecipeBook.Application.Services
{
    public interface IFileStorageService
    {
        Task<GetFileResult> GetFile( string path );
        void RemoveFile( string path, string fileName );
        Task<SaveFileResult> SaveFile( StorageFile file, string path );
    }
}
