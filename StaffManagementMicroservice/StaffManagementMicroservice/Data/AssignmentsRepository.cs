using Microsoft.EntityFrameworkCore;
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

        public async Task<IEnumerable<Assignment>> GetAssignmentsAsync()
        {
            var assignments = await _context.Assignments.ToListAsync();
            return assignments;
        }

        public async Task<Assignment> GetAssignmentAsync(int id)
        {
            var assignment = await _context.Assignments.Where(assignment => assignment.Id == id).FirstOrDefaultAsync();
            return assignment;
        }

        public async Task<int> PostAssignmentAsync(PostAssignmentDto postAssignmentDto, int userId)
        {
            Assignment assignment = new Assignment()
            {
                UserId = userId,
                RoomNumber = postAssignmentDto.RoomNumber,
                Type = postAssignmentDto.Type,
                Observations = postAssignmentDto.Observations,
                AddedAt = DateTime.Now,
                Status = 0
            };
            _context.Add(assignment);
            await _context.SaveChangesAsync();
            return 1;
        }

        public async Task<IEnumerable<Assignment>> GetAssignmentsByUserIdAsync(int userId)
        {
            return await _context.Assignments.Where(assignment => assignment.UserId == userId).ToListAsync();

        }

        public async Task<bool> UpdateAsync(int status, int id)
        {
            var result = _context.Assignments.Find(id);
            if (result == null)
            {
                return false;
            }
            result.Status = status;
            await _context.SaveChangesAsync();
            return true;

        }

        public async Task DeleteByIdAsync(int id)
        {
            var assignment = await _context.Assignments.FindAsync(id);
            _context.Remove(assignment);
            await _context.SaveChangesAsync();
        }

        public async Task<bool> PrioritizeAssignmentAsync(int id)
        {
            var result = _context.Assignments.Find(id);
            if (result == null)
            {
                return false;
            }
            result.Status = 1;
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
