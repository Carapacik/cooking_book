using System;
using System.IO;
using System.Linq;
using RecipeBook.Application.Services.Configs;
using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Application.Services
{
    public class FileStorageService : IFileStorageService
    {
        private readonly FileStorageSettings _fileStorageSettings;

        public FileStorageService( FileStorageSettings fileStorageSettings )
        {
            _fileStorageSettings = fileStorageSettings;
        }

        public GetFileResult GetFile( string path )
        {
            return new GetFileResult( File.ReadAllBytes( $"{_fileStorageSettings.BasePath}\\{path}" ),
                path.Split( '.' ).LastOrDefault() );
        }

        public void RemoveFile( string path, string fileName )
        {
            File.Delete( $"{_fileStorageSettings.BasePath}\\{path}\\{fileName}" );
        }

        public SaveFileResult SaveFile( StorageFile file, string path )
        {
            string fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            string newFilePath = $"{_fileStorageSettings.BasePath}\\{path}\\{fileName}";
            File.WriteAllBytes( newFilePath, file.Data ); // Exception
            return new SaveFileResult( $"{fileName}" );
        }
    }
}
