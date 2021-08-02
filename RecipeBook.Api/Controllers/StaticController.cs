using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Application.Services;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StaticController : ControllerBase
    {
        private readonly StaticService _staticService;

        public StaticController(StaticService staticService)
        {
            _staticService = staticService;
        }

        [HttpGet("{fileName}")]
        public IActionResult GetImage(string fileName)
        {
            var result = _staticService.GetFile(fileName);
            return new FileContentResult(result.Content, $"image/{result.Extension}");
        }
    }
}