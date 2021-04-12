using System.Collections.Generic;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{

    public interface IUsersRepository
    {
        Task<int> RegisterAsync(UserRegister userRegister);
        Task<int> LoginAsync(UserCredentials userCredentials);
        Task<IEnumerable<User>> GetAllAsync();
        Task<User> GetByIdAsync(int id);
        Task<bool> UpdateAsync(UserRegister user, int userId);
        Task DeleteByIdAsync(int id);
    }
}
