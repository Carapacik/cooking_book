using System;
using System.IO;
using System.Linq;
using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Application.Services
{
    public class StaticService : IStaticService
    {
        private readonly StaticStorageSettings _staticStorageSettings;

        public StaticService(StaticStorageSettings staticStorageSettings)
        {
            _staticStorageSettings = staticStorageSettings;
        }

        public GetFileResult GetFile(string filePath)
        {
            return new GetFileResult(File.ReadAllBytes($"{_staticStorageSettings.BasePath}\\{filePath}"),
                filePath.Split('.').LastOrDefault());
        }

        public SaveFileResult SaveFile(FormFileAdapter file, string path)
        {
            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $"{_staticStorageSettings.BasePath}\\{path}\\{fileName}";
            File.WriteAllBytes(newFilePath, file.Data); // Exception
            return new SaveFileResult($"{fileName}");
        }
    }
}