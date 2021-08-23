namespace RecipeBook.Api.Dtos
{
    public class AuthenticationResultDto
    {
        public AuthenticationResultDto( bool isSuccess, string errorMessage )
        {
            IsSuccess = isSuccess;
            ErrorMessage = errorMessage;
        }

        public bool IsSuccess { get; }
        public string ErrorMessage { get; }
    }
}
