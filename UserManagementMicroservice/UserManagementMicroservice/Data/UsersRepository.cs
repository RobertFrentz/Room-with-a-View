using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UserManagementMicroservice.DTOs;
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

        public async Task<int> RegisterAsync(UserRegisterDto userRegister, int role)
        {
            if(this.context.Users.Any(user => user.Username == userRegister.Username))
            {
                return -1;
            }

            if(this.context.Users.Any(user => user.Email == Cryptography.HashString(userRegister.Email)))
            {
                return -2;
            }
            User registerUser= new (userRegister.Username, userRegister.Email, userRegister.Password, role);
            var user = this.context.Add(Cryptography.SecureUserData(registerUser));
            await this.context.SaveChangesAsync();
            return user.Entity.Id;
        }

        public async Task<User> LoginAsync(UserCredentialsDto userCredentials)
        {
            var user = await this.context.Users.Where(user => user.Email == Cryptography.HashString(userCredentials.Email) 
                                          && user.Password == Cryptography.HashString(userCredentials.Password)).FirstOrDefaultAsync();
            if (user == null)
            {
                return null;
            }
            return user;

        }

        public async Task<bool> UpdateAsync(UserRegisterDto user, int userId)
        {
          var result = this.context.Users.Find(userId);
          if(result==null)
            {
                return false;
            }
          result.Username = user.Username ?? result.Username;
          result.Email = Cryptography.HashString(user.Email) ?? result.Email;
          result.Password = Cryptography.HashString(user.Password) ?? result.Password;
          await this.context.SaveChangesAsync();
          return true;
        }

        public async Task<IEnumerable<User>> GetAllAsync(int userId)
        {
            var result = await this.context.Users.FindAsync(userId);
            if(result == null || result.Role != 1)
            {
                return null;
            }
            return await this.context.Users.ToListAsync();
        }

        public async Task<User> GetByIdAsync(int userId)
        {
            return await this.context.Users.FindAsync(userId);
        }

        public async Task DeleteByIdAsync(int userId)
        {
            var user = await this.context.Users.FindAsync(userId);
            this.context.Remove(user);
            await this.context.SaveChangesAsync();
  
        }
        public async Task<bool> HasAdminPrivileges(int userId)
        {
            var user = await this.context.Users.FindAsync(userId);
            if(user == null)
            {
                return false;
            }
            if(user.Role == 1)
            {
                return true;
            }
            return false;
        }

        public async Task<IEnumerable<StaffResponseDto>> GetStaffMembersAsync()
        {
            var staff = await context.Users.Where(user => user.Role == 2).Select(user =>
                   new StaffResponseDto()
                   {
                       Name = user.Username,
                       UserId = user.Id
                   }).ToListAsync();
            if (staff == null)
            {
                return null;
            }
            return staff;
        }

        public async Task<int> GetUserIdByNameAsync(string name)
        {
            var user = await this.context.Users.Where(user => user.Username == name).FirstOrDefaultAsync();
            if(user == null)
            {
                return 0;
            }
            return user.Id;
        }
    }
}
