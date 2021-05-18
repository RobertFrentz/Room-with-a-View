using StaffManagementMicroservice.DTOs;
using StaffManagementMicroservice.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Data
{
    public interface IAssignmentsRepository
    {
        Task<IEnumerable<Assignment>> GetAssignmentsAsync();

        Task<Assignment> GetAssignmentAsync(int id);

        Task<int> PostAssignmentAsync(PostAssignmentDto postAssignmentDto, int userId);

        Task<IEnumerable<Assignment>> GetAssignmentByUserIdAsync(int userId);

        Task<bool> UpdateAsync(int status, int id);

        Task DeleteByIdAsync(int id);



    }
}
