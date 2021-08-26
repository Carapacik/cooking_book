using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
            user.Password = HashPassword( user.Password );
            _context.Set<User>().Add( user );
        }

        public void Edit( User existingUser, User editedUser )
        {
            existingUser.Name = editedUser.Name;
            existingUser.Description = editedUser.Description;
            existingUser.Login = editedUser.Login;
            editedUser.Password = HashPassword( existingUser.Password );
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

        private static string HashPassword( string password )
        {
            byte[] hash = MD5.Create().ComputeHash( Encoding.UTF8.GetBytes( password ) );

            return Convert.ToBase64String( hash );
        }
    }
}
