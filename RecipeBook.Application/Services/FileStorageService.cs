using System;
using System.IO;
using System.Linq;
using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Application.Services
{
    public class FileStorageService : IFileStorageService
    {
        private readonly FileStorageSettings _fileStorageSettings;

        public FileStorageService(FileStorageSettings fileStorageSettings)
        {
            _fileStorageSettings = fileStorageSettings;
        }

        public GetFileResult GetFile(string filePath)
        {
            return new GetFileResult(File.ReadAllBytes($"{_fileStorageSettings.BasePath}\\{filePath}"),
                filePath.Split('.').LastOrDefault());
        }

        public SaveFileResult SaveFile(StorageFile file, string path)
        {
            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $"{_fileStorageSettings.BasePath}\\{path}\\{fileName}";
            File.WriteAllBytes(newFilePath, file.Data); // Exception
            return new SaveFileResult($"{fileName}");
        }
    }
}