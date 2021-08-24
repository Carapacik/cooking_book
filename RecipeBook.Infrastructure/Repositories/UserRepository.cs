using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
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

        public async Task<User> GetById( int id )
        {
            return await GetQuery().FirstOrDefaultAsync( x => x.UserId == id );
        }

        public async Task<IReadOnlyList<User>> GetByIds( List<int> ids )
        {
            return await GetQuery().Where( x => ids.Contains( x.UserId ) ).ToListAsync();
        }

        public async Task<User> GetByLogin( string login )
        {
            return await GetQuery().FirstOrDefaultAsync( x => x.Login == login );
        }

        private IQueryable<User> GetQuery()
        {
            return _context.Set<User>().AsQueryable();
        }
    }
}
