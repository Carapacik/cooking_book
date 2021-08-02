namespace RecipeBook.Api.Application.Services.Entities
{
    public class GetFileResult
    {
        public GetFileResult(byte[] content, string extension)
        {
            Content = content;
            Extension = extension;
        }

        public byte[] Content { get; set; }
        public string Extension { get; set; }
    }
}