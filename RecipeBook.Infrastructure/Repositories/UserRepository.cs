using System.Linq;
using RecipeBook.Domain.Entities;
using RecipeBook.Domain.Repositories;

namespace RecipeBook.Infrastructure.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly RecipeBookDbContext _context;

        public UserRepository( RecipeBookDbContext context )
        {
            _context = context;
        }

        public void Add( User user )
        {
            _context.Set<User>().Add( user );
        }

        public User GetById( int id )
        {
            return GetQuery().FirstOrDefault( x => x.UserId == id );
        }

        public User GetByLogin( string login )
        {
            return GetQuery().FirstOrDefault( x => x.Login == login );
        }

        private IQueryable<User> GetQuery()
        {
            return _context.Set<User>().AsQueryable();
        }
    }
}
