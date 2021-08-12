using RecipeBook.Application;

namespace RecipeBook.Infrastructure
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly RecipeBookDbContext _context;

        public UnitOfWork( RecipeBookDbContext context )
        {
            _context = context;
        }

        public void Commit()
        {
            _context.SaveChanges();
        }
    }
}
