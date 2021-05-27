using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UserManagementMicroservice.DTOs;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;

namespace UserManagementMicroservice.Repositories
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
            var users = await this.context.Users.ToListAsync();
            foreach (User el in users)
            {
                if (Cryptography.Decrypt(el.Email) == userRegister.Email || el.Email == Cryptography.HashString(userRegister.Email))
                {
                    return -2;
                }
                if (el.Username == userRegister.Username)
                {
                    return -2;
                }
            }
            User registerUser = new(userRegister.Username, userRegister.Email, userRegister.Password, role);
            var user = this.context.Add(Cryptography.SecureUserData(registerUser));
            await this.context.SaveChangesAsync();
            return user.Entity.Id;
        }

        public async Task<User> LoginAsync(UserCredentialsDto userCredentials)
        {
            var users = await this.context.Users.ToListAsync();
            User user = null;
            foreach (User el in users)
            {
                if (Cryptography.Decrypt(el.Email) == userCredentials.Email || el.Email == Cryptography.HashString(userCredentials.Email))
                {
                    if (el.Password == Cryptography.HashString(userCredentials.Password))
                    {
                        user = el;
                    }
                }
            }
            return user;

        }

        public async Task<bool> UpdateAsync(UserRegisterDto user, int userId)
        {
            var result = this.context.Users.Find(userId);
            if (result == null)
            {
                return false;
            }
            result.Username = user.Username ?? result.Username;
            if (user.Email != null)
            {
                result.Email = Cryptography.Encrypt(user.Email);
            }
            if (user.Password != null)
            {
                result.Password = Cryptography.HashString(user.Password);
            }
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
            var user = await this.context.Users.FindAsync(userId);
            if (user == null)
            {
                return null;
            }
            return new User()
            {
                Id = user.Id,
                Username = user.Username,
                Email = Cryptography.Decrypt(user.Email) ?? user.Email,
                Password = user.Password,
                Role = user.Role
            };
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
