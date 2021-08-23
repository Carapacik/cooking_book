using Microsoft.AspNetCore.Http;

namespace RecipeBook.Application.Entities
{
    public class AuthenticateUserCommand
    {
        public AuthenticateUserCommand( string name, string login, string password, HttpContext httpContext )
        {
            Name = name;
            Login = login;
            Password = password;
            HttpContext = httpContext;
        }

        public string Name { get; }
        public string Login { get; }
        public string Password { get; }
        public HttpContext HttpContext { get; }
    }
}
