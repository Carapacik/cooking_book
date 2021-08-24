using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace RecipeBook.Api.Converters
{
    public class FormFileAdapter
    {
        public byte[] Data { get; private set; }
        public string FileExtension { get; private set; }

        public static async Task<FormFileAdapter> Create( IFormFile formFile )
        {
            if ( formFile == null )
            {
                return null;
            }

            byte[] bytes;
            await using ( MemoryStream memoryStream = new() )
            {
                await using ( Stream fileStream = formFile.OpenReadStream() )
                {
                    await fileStream.CopyToAsync( memoryStream );
                    bytes = memoryStream.ToArray();
                }
            }

            return new FormFileAdapter { FileExtension = formFile.FileName.Split( '.' ).Last(), Data = bytes };
        }
    }
}
