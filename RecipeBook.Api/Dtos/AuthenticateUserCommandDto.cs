namespace RecipeBook.Api.Dtos
{
    public class AuthenticateUserCommandDto
    {
        public string Name { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
    }
}
