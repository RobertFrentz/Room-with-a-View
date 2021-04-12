using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;

namespace UserManagementMicroservice.Data
{
    public class UsersRepository : IUsersRepository
    {
        private readonly DataContext context;

        public UsersRepository(DataContext context)
        {
            this.context = context;
        }

        public async Task<int> RegisterAsync(UserRegister userRegister)
        {
            if(this.context.Users.Any(user => user.Username == userRegister.Username))
            {
                return -1;
            }
            if(this.context.Users.Any(user => user.Email == Cryptography.HashString(userRegister.Email)))
            {
                return -2;
            }
            User registerUser= new User(userRegister.Username, userRegister.Email, userRegister.Password);
            this.context.Add(Cryptography.HashUserData(registerUser));
            await this.context.SaveChangesAsync();
            return 1;
        }

        public async Task<int> LoginAsync(UserCredentials userCredentials)
        {
            var user = await this.context.Users.Where(user => user.Email == Cryptography.HashString(userCredentials.Email) 
                                          && user.Password == Cryptography.HashString(userCredentials.Password)).FirstOrDefaultAsync();
            if (user == null)
            {
                return -1;
            }
            return user.Id;

        }

        public async Task<bool> UpdateAsync(UserRegister user, int userId)
        {
          var result = this.context.Users.Find(userId);
          if (result == null)
          {
             return false;
          }
          result.Username = user.Username ?? result.Username;
          result.Email = Cryptography.HashString(user.Email) ?? result.Email;
          result.Password = Cryptography.HashString(user.Password) ?? result.Password;
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
