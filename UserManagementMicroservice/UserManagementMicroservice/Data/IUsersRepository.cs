using System.Collections.Generic;
using System.Threading.Tasks;
using UserManagementMicroservice.DTOs;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{

    public interface IUsersRepository
    {
        Task<int> RegisterAsync(UserRegisterDto userRegister, int role);
        Task<User> LoginAsync(UserCredentialsDto userCredentials);
        Task<IEnumerable<User>> GetAllAsync(int userId);
        Task<User> GetByIdAsync(int userId);

        Task<int> GetUserIdByNameAsync(string name);
        Task<bool> UpdateAsync(UserRegisterDto user, int userId);
        Task DeleteByIdAsync(int userId);

        Task<bool> HasAdminPrivileges(int userId);
    }
}
