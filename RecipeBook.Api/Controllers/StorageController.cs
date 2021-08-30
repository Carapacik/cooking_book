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
            if ( fileName.Contains( "\\" ) )
            {
                return BadRequest();
            }

            GetFileResult result = await _fileStorageService.GetFile( $"images\\{fileName}" );
            if ( result == null )
            {
                return NotFound();
            }

            return new FileContentResult( result.Content, $"image/{result.Extension}" );
        }
    }
}
