using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Entities;
using System.Collections.Generic;

namespace RoomManagementMicroservice.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<Room> Rooms { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Room>().Property("Id").ValueGeneratedOnAdd();
            modelBuilder.Entity<Room>()
                        .HasData(new List<Room>()
                        {
                        new Room
                        {
                            Id = 1,
                            RoomCategory = "Standard",
                            RoomNumber = 100,
                            PersonsNumber = 2,
                            Price = 100,
                            Description="blabla",
                            Facilities = "Free Wi-Fi",
                            State = "Available"
                        },
                        new Room
                         {
                            Id = 2,
                            RoomCategory = "Standard",
                            RoomNumber = 101,
                            PersonsNumber = 3,
                            Price = 170,
                            Description = "blabla",
                            Facilities = "Free Wi-Fi",
                            State = "Booked",
                        },
                        new Room
                        {
                            Id=3,
                            RoomCategory = "Standard",
                            RoomNumber = 102,
                            PersonsNumber = 3,
                            Price = 130,
                            Description = "blabla",
                            Facilities = "Free Wi-Fi",
                            State = "Booked"
                        },
            new Room
            {
                Id = 4,
                RoomCategory = "Standard",
                RoomNumber = 103,
                PersonsNumber = 2,
                Price = 150,
                Description = "blabla",
                Facilities = "Free Wi-Fi",
                State = "Booked",
            } });

        }
    }
}


