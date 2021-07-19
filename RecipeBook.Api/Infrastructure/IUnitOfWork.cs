namespace RecipeBook.Api.Infrastructure
{
    public interface IUnitOfWork
    {
        void Commit();
    }
}