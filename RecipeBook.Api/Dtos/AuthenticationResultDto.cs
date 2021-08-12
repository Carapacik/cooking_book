namespace RecipeBook.Api.Dtos
{
    public class AuthenticationResultDto
    {
        public AuthenticationResultDto( bool result )
        {
            Result = result;
        }

        public bool Result { get; set; }
    }
}
