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
            User registerUser= new User(0, userRegister.Username, userRegister.Email, userRegister.Password);
            this.context.Add(Cryptography.HashUserData(registerUser));
            await this.context.SaveChangesAsync();
            return 1;
        }

        public async Task<string> LoginAsync(UserCredentials userCredentials)
        {
            var user = await this.context.Users.Where(user => user.Email == Cryptography.HashString(userCredentials.Email) 
                                          && user.Password == Cryptography.HashString(userCredentials.Password)).FirstOrDefaultAsync();
            if (user == null)
            {
                return "false";
            }
            var token = JsonConvert.SerializeObject(new{jwt=Jwt.CreateJWT(user.Id, 1) });
            return token;

        }

        public async Task<bool> UpdateAsync(User user,string authentification_Token)
        {
            string decodeAuth = Jwt.CheckJWT(authentification_Token);
            if(decodeAuth.Equals("Token has expired") || decodeAuth.Equals("Token has invalid signature"))
            {
                return false;
            }
            else
            {
                int userId = Jwt.ExtractUserId(decodeAuth);
                if (this.context.Users.Find(userId)==null)
                {
                    return false;
                }
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
