using System.Collections.Generic;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{

    public interface IUsersRepository
    {
        Task<int> RegisterAsync(string username, string email, string password);
        Task<string> LoginAsync(string email, string password);
        Task<IEnumerable<User>> GetAllAsync();
        Task<User> GetByIdAsync(int id);
        Task<bool> UpdateAsync(User user,string authentification_Token);
        Task DeleteByIdAsync(int id);
    }
}
