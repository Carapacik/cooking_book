using System.Threading.Tasks;

namespace RecipeBook.Application
{
    public interface IUnitOfWork
    {
        Task Commit();
    }
}
