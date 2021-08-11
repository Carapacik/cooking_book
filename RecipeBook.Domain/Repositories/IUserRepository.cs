using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IUserRepository
    {
        void Add( User user );
        User GetById( int id );
        User GetByLogin( string login );
    }
}
