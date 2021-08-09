using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;

namespace RecipeBook.Application.Services.Entities
{
    public class RecipeFile
    {
        public byte[] Data { get; set; }
        public string FileExtension { get; set; }

        public static RecipeFile Create(IFormFile formFile)
        {
            byte[] bytes;
            using (var ms = new MemoryStream())
            using (var stream = formFile.OpenReadStream())
            {
                stream.CopyTo(ms);
                bytes = ms.ToArray();
            }

            return new RecipeFile
            {
                FileExtension = formFile.FileName.Split('.').Last(),
                Data = bytes
            };
        }
    }
}