using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;

namespace RecipeBook.Api.Application.Converters
{
    public class FormFileConverter
    {
        public byte[] Data { get; set; }
        public string FileName { get; set; }
        public string FileExtension { get; set; }

        public static FormFileConverter Create(IFormFile formFile)
        {
            byte[] bytes;
            using (var ms = new MemoryStream())
            using (var stream = formFile.OpenReadStream())
            {
                stream.CopyTo(ms);
                bytes = ms.ToArray();
            }

            return new FormFileConverter
            {
                FileName = formFile.FileName,
                FileExtension = formFile.FileName.Split('.').Last(),
                Data = bytes
            };
        }
    }
}