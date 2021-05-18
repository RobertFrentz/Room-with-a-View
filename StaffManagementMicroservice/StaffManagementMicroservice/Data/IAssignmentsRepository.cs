using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StaffManagementMicroservice.DTOs;
using StaffManagementMicroservice.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Data
{
    public interface IAssignmentsRepository
    {
        Task<IEnumerable<AssignmentDescriptionDto>> GetAssignmentsAsync();

        Task<AssignmentDescriptionDto> GetAssignmentAsync(int id);
        

    }
}
