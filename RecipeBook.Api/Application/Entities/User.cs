namespace RecipeBook.Api.Application.Entities
{
    public class User
    {
        public int UserId { get; private set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
    }
}