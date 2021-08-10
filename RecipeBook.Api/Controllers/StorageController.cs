using Microsoft.AspNetCore.Mvc;
using RecipeBook.Application.Services;
using RecipeBook.Application.Services.Entities;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route( "[controller]" )]
    public class StorageController : ControllerBase
    {
        private readonly IFileStorageService _fileStorageService;

        public StorageController( IFileStorageService fileStorageService )
        {
            _fileStorageService = fileStorageService;
        }

        [HttpGet( "{path}/{fileName}" )]
        public IActionResult GetImage( string path, string fileName )
        {
            GetFileResult result = _fileStorageService.GetFile( $"{path}\\{fileName}" );
            return new FileContentResult( result.Content, $"image/{result.Extension}" );
        }
    }
}
