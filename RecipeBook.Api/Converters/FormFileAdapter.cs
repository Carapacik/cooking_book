using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;

namespace RecipeBook.Api.Converters
{
    public class FormFileAdapter
    {
        public byte[] Data { get; set; }
        public string FileExtension { get; set; }

        public static FormFileAdapter Create( IFormFile formFile )
        {
            if ( formFile == null ) { return null; }

            byte[] bytes;
            using ( MemoryStream ms = new() )
            using ( Stream stream = formFile.OpenReadStream() )
            {
                stream.CopyToAsync( ms );
                bytes = ms.ToArray();
            }

            return new FormFileAdapter { FileExtension = formFile.FileName.Split( '.' ).Last(), Data = bytes };
        }
    }
}
