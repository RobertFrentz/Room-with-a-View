using System.Collections.Generic;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{

    public interface IUsersRepository
    {
        Task<int> RegisterAsync(UserRegister userRegister);
        Task<int> LoginAsync(UserCredentials userCredentials);
        Task<IEnumerable<User>> GetAllAsync(int userId);
        Task<User> GetByIdAsync(int userId);
        Task<bool> UpdateAsync(UserRegister user, int userId);
        Task DeleteByIdAsync(int userId);
    }
}
