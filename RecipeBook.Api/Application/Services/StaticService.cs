using System;
using System.IO;
using System.Linq;
using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public class StaticService : IStaticService
    {
        private readonly StaticStorageSettings _staticStorageSettings;

        public StaticService(StaticStorageSettings staticStorageSettings)
        {
            _staticStorageSettings = staticStorageSettings;
        }

        public GetFileResult GetFile(string imagePath)
        {
            return new(
                File.ReadAllBytes($"{_staticStorageSettings.BasePath}\\{imagePath}"),
                imagePath.Split('.').LastOrDefault());
        }

        public SaveFileResult SaveFile(FormFileAdapter file)
        {
            var fileName = $"{Guid.NewGuid().ToString()}.{file.FileExtension}";
            var newFilePath = $@"{_staticStorageSettings.BasePath}\images\{fileName}";
            File.WriteAllBytes(newFilePath, file.Data);

            return new SaveFileResult($"{fileName}");
        }
    }
}