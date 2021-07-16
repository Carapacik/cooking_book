using System.Linq;
using RecipeBook.Entities;
using RecipeBook.Infrastructure;

namespace RecipeBook.Repositories
{
    public class RecipeRepository : IRecipeRepository
    {
        private readonly RecipeBookDbContext _context;

        public RecipeRepository(RecipeBookDbContext context)
        {   
            _context = context;
        }

        public RecipeEntity GetById(string id)
        {
            return _context.Set<RecipeEntity>().FirstOrDefault(item => item.Id == id);
        }
    }
}