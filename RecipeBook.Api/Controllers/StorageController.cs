using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RecipeBook.Application.Entities;
using RecipeBook.Application.Services;

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

        [HttpGet( "images/{fileName}" )]
        public async Task<IActionResult> GetImage( string fileName )
        {
            GetFileResult result = await _fileStorageService.GetFile( $"images\\{fileName}" );
            return new FileContentResult( result.Content, $"image/{result.Extension}" );
        }
    }
}
