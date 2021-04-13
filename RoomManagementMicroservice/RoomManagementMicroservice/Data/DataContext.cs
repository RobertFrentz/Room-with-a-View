using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Entities;
using System;

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
                        .HasData(new Room
                        {
                            Id = 1,
                            RoomCategory = "Standard",
                            CheckIn = null,
                            CheckOut = null,
                            PersonsNumber = 2,
                            Price = 100,
                            Description="blabla",
                            Facilities ="Wi-Fi,Apa calda,Aer" ,
                            State = "Available"
                        },
                        new Room
                         {
                            Id = 2,
                            RoomCategory = "Standard",
                            CheckIn = new DateTime(2021,4,10),
                            CheckOut = new DateTime(2021, 4, 13),
                            PersonsNumber = 3,
                            Price = 170,
                            Description = "blabla",
                            Facilities = "Wi-Fi,Apa calda,Aer",
                            State = "Booked",
                        },
                        new Room
                        {
                            Id=3,
                            RoomCategory = "Standard",
                            CheckIn = new DateTime(2021, 4, 14),
                            CheckOut = new DateTime(2021, 4, 16),
                            PersonsNumber = 3,
                            Price = 130,
                            Description = "blabla",
                            Facilities = "Wi-Fi,Apa calda,Aer",
                            State = "Booked"
                        },
            new Room
            {
                Id = 4,
                RoomCategory = "Standard",
                CheckIn = new DateTime(2021, 4, 6),
                CheckOut = new DateTime(2021, 4, 9),
                PersonsNumber = 2,
                Price = 150,
                Description = "blabla",
                Facilities = "Wi-Fi,Apa calda,Aer",
                State = "Booked",
            });
        }
    }
}


