
using Microsoft.EntityFrameworkCore;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Repositories
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<User> Users { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                        .Property(user => user.Id)
                        .ValueGeneratedOnAdd();
        }
    }
}
