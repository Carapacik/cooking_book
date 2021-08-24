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
            return await _context.Set<User>().FirstOrDefaultAsync( x => x.UserId == id );
        }

        public async Task<IReadOnlyList<User>> GetByIds( List<int> ids )
        {
            return await _context.Set<User>().Where( x => ids.Contains( x.UserId ) ).ToListAsync();
        }

        public async Task<User> GetByLogin( string login )
        {
            return await _context.Set<User>().FirstOrDefaultAsync( x => x.Login == login );
        }
    }
}
