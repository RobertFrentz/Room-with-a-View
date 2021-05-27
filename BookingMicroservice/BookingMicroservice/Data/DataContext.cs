using BookingMicroservice.Entities;
using Microsoft.EntityFrameworkCore;

namespace BookingMicroservice.Repositories
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<Booking> Bookings { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Booking>().Property("Id").ValueGeneratedOnAdd();
        }
    }
}
