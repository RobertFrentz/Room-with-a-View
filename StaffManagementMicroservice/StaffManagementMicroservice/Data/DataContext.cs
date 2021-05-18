using Microsoft.EntityFrameworkCore;
using StaffManagementMicroservice.Entities;

namespace StaffManagementMicroservice.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<Assignment> Assignments { get; set; }
    }
    
}
