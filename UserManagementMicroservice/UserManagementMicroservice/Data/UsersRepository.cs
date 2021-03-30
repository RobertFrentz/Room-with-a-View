using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{
    public class UsersRepository : IUsersRepository
    {
        private readonly DataContext context;

        public UsersRepository(DataContext context)
        {
            this.context = context;
        }

        public async Task<int> RegisterAsync(string username, string email, string password)
        {
            if(this.context.Users.Any(user => user.Username == username))
            {
                return -1;
            }
            if(this.context.Users.Any(user => user.Email == email))
            {
                return -2;
            }
            this.context.Add(new User(0, username, email, password));
            await this.context.SaveChangesAsync();
            return 1;
        }

        public async Task<bool> LoginAsync(string email, string password)
        {
            var user = await this.context.Users.Where(user => user.Email == email && user.Password == password).FirstOrDefaultAsync();
            if (user == null)
            {
                return false;
            }
            return true;

        }

        public async Task<bool> UpdateAsync(User user)
        {
            if(!this.context.Users.Any(userDatabase => userDatabase.Email == user.Email))
            {
                return false;
            }
            this.context.Update(user);
            await this.context.SaveChangesAsync();
            return true;
        }

        public async Task<IEnumerable<User>> GetAllAsync()
        {
            return await this.context.Users.ToListAsync();
        }

        public async Task<User> GetByIdAsync(int id)
        {
            return await this.context.Users.FindAsync(id);
        }

        public async Task DeleteByIdAsync(int id)
        {
            var user = await this.context.Users.FindAsync(id);
            this.context.Remove(user);
            await this.context.SaveChangesAsync();
        }
    }
}
