using System.Collections.Generic;
using System.Threading.Tasks;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IUserRepository
    {
        void Add( User user );
        void Edit( User existingUser, User editedUser );
        Task<User> GetById( int id );
        Task<IReadOnlyList<User>> GetByIds( List<int> ids );
        Task<User> GetByLogin( string login );
    }
}
