using System.Collections.Generic;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{

    public interface IUsersRepository
    {
        Task<int> RegisterAsync(UserRegister userRegister);
        Task<string> LoginAsync(UserCredentials userCredentials);
        Task<IEnumerable<User>> GetAllAsync();
        Task<User> GetByIdAsync(int id);
        Task<bool> UpdateAsync(User user,string authentification_Token);
        Task DeleteByIdAsync(int id);
    }
}
