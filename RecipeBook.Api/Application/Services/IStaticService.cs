using RecipeBook.Api.Application.Converters;
using RecipeBook.Api.Application.Services.Entities;

namespace RecipeBook.Api.Application.Services
{
    public interface IStaticService
    {
        GetFileResult GetFile(string path);
        SaveFileResult SaveFile(FormFileAdapter file, string path);
    }
}