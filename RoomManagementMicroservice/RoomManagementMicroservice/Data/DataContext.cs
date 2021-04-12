using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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
            modelBuilder.Entity<Room>()
                        .HasData(new Room
                        {
                            Id = 1,
                            UserId = 1,
                            CheckIn = DateTime.Now,
                            CheckOut = DateTime.Now,
                            PersonsNumber = 0,
                            RoomCategory = "Standard",
                            State = "Available"
                        },
                        new Room
                         {
                            Id = 2,
                            UserId = 3,
                            CheckIn = DateTime.Now,
                            CheckOut = DateTime.Now,
                            PersonsNumber = 3,
                            RoomCategory = "Standard",
                            State = "Booked"
                            },
                        new Room
                        {
                            Id=3,
                            UserId = 3,
                            CheckIn = DateTime.Now,
                            CheckOut = DateTime.Now,
                            PersonsNumber = 3,
                            RoomCategory = "Standard",
                            State = "Booked"
                        });
        }
    }
}


