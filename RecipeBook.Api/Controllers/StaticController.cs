using Microsoft.AspNetCore.Mvc;
using RecipeBook.Api.Application.Services;

namespace RecipeBook.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StaticController : ControllerBase
    {
        private readonly IStaticService _staticService;

        public StaticController(IStaticService staticService)
        {
            _staticService = staticService;
        }

        [HttpGet("{path}/{fileName}")]
        public IActionResult GetImage(string path, string fileName)
        {
            var result = _staticService.GetFile($"{path}\\{fileName}");
            return new FileContentResult(result.Content, $"image/{result.Extension}");
        }
    }
}