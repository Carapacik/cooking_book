using System.Linq;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StaticController : ControllerBase
    {
        private readonly StaticStorageSettings _staticStorageSettings;

        public StaticController(StaticStorageSettings staticStorageSettings)
        {
            _staticStorageSettings = staticStorageSettings;
        }

        [HttpGet("{filename}")]
        public IActionResult GetImage(string filename)
        {
            var r = System.IO.File.ReadAllBytes($"{_staticStorageSettings.RecipeImagesPath}\\{filename}");
            var fileExtension = filename.Split('.').LastOrDefault();

            return new FileContentResult(r, $"image/{fileExtension}");
        }
    }
}