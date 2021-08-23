using System.Collections.Generic;
using RecipeBook.Domain.Entities;

namespace RecipeBook.Domain.Repositories
{
    public interface IUserRepository
    {
        void Add( User user );
        User GetById( int id );
        List<User> GetByIds( List<int> ids );
        User GetByLogin( string login );
    }
}
