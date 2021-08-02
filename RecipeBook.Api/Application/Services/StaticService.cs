using System.IO;
using System.Linq;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public class StaticService
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
    }
}