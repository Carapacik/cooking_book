namespace RecipeBook.Application.Entities
{
    public class AuthenticationResult
    {
        public AuthenticationResult( bool result, string error )
        {
            Result = result;
            Error = error;
        }

        public bool Result { get; }
        public string Error { get; }
    }
}
