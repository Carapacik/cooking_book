using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;

namespace RecipeBook.Api.Converters
{
    public class FormFileAdapter
    {
        public byte[] Data { get; set; }
        public string FileExtension { get; set; }

        public static FormFileAdapter Create(IFormFile formFile)
        {
            byte[] bytes;
            using (var ms = new MemoryStream())
            using (var stream = formFile.OpenReadStream())
            {
                stream.CopyTo(ms);
                bytes = ms.ToArray();
            }

            return new FormFileAdapter
            {
                FileExtension = formFile.FileName.Split('.').Last(),
                Data = bytes
            };
        }
    }
}