using System.Threading.Tasks;

namespace RecipeBook.Domain
{
    public interface IUnitOfWork
    {
        Task Commit();
    }
}
