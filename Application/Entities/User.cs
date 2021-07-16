namespace RecipeBook.Application.Entities
{
    public class User
    {
        public long UserId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
    }
}