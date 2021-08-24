using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using RecipeBook.Application.Configs;
using RecipeBook.Application.Entities;

namespace RecipeBook.Application.Services
{
    public class FileStorageService : IFileStorageService
    {
        private readonly FileStorageSettings _fileStorageSettings;

        public FileStorageService( FileStorageSettings fileStorageSettings )
        {
            _fileStorageSettings = fileStorageSettings;
        }

        public async Task<GetFileResult> GetFile( string path )
        {
            return new GetFileResult(
                await File.ReadAllBytesAsync( $"{_fileStorageSettings.BasePath}\\{path}" ),
                path.Split( '.' ).LastOrDefault() );
        }

        public void RemoveFile( string path, string fileName )
        {
            File.Delete( $"{_fileStorageSettings.BasePath}\\{path}\\{fileName}" );
        }

        public async Task<SaveFileResult> SaveFile( StorageFile file, string path )
        {
            string fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            string newFilePath = $"{_fileStorageSettings.BasePath}\\{path}\\{fileName}";
            await File.WriteAllBytesAsync( newFilePath, file.Data );
            return new SaveFileResult( $"{fileName}" );
        }
    }
}
