using Microsoft.EntityFrameworkCore;
using SQLitePCL;
using StaffManagementMicroservice.DTOs;
using StaffManagementMicroservice.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Data
{
    public class AssignmentsRepository : IAssignmentsRepository
    {
        private readonly DataContext _context;

        public AssignmentsRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<AssignmentDescriptionDto>> GetAssignmentsAsync()
        {
            var assignments = await _context.Assignments.Select(assignment =>
                    new AssignmentDescriptionDto()
                    {
                        UserId = assignment.UserId,
                        Type = assignment.Type,
                        Observations = assignment.Observations,
                        AddedAt = assignment.AddedAt,
                        Status = assignment.Status,
                    }).ToListAsync();
            return assignments;
        }

        public async Task<AssignmentDescriptionDto> GetAssignmentAsync(int id)
        {
            var assignment = await _context.Assignments.Where(assignment => assignment.Id == id).FirstOrDefaultAsync();
            if(assignment != null)
            {
                return new AssignmentDescriptionDto()
                        {
                            UserId = assignment.UserId,
                            Type = assignment.Type,
                            Observations = assignment.Observations,
                            AddedAt = assignment.AddedAt,
                            Status = assignment.Status,
                        };
            }
            return null;
        }

    }
}
