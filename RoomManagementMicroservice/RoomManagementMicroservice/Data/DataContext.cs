using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Entities;
using RoomManagementMicroservice.Utils;
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
                            Id = 1, RoomCategory = "Standard",RoomNumber = 100,PersonsNumber = 2,Price = 150,
                            Description=new Description(0).Text,Facilities = "Free Wi-Fi, Air Conditioning System",
                            State = "Available",Image="standard0.jpg"
                        },
                        new Room
                         {
                            Id = 2, RoomCategory = "Standard",RoomNumber = 101,PersonsNumber = 3,Price = 180,
                            Description=new Description(1).Text,Facilities = "Free Wi-Fi, Air Conditioning System",
                            State = "Available",Image="standard1.jpg"
                        },
                        new Room
                        {
                            Id = 3, RoomCategory = "Standard",RoomNumber = 102,PersonsNumber = 2,Price = 150,
                            Description=new Description(0).Text,Facilities = "Free Wi-Fi, Air Conditioning System",
                            State = "Available",Image="standard2.jpg"
                        },
                        new Room
                        {
                            Id = 4, RoomCategory = "Standard",RoomNumber = 103,PersonsNumber = 2,Price = 150,
                            Description=new Description(0).Text,Facilities = "Free Wi-Fi, Air Conditioning System",
                            State = "Available",Image="standard0.jpg"
                        },
                        new Room
                        {
                            Id = 5, RoomCategory = "Standard",RoomNumber = 104,PersonsNumber = 3,Price = 180,
                            Description=new Description(1).Text,Facilities = "Free Wi-Fi, Air Conditioning System",
                            State = "Available",Image="standard1.jpg"
                        },
                        new Room
                        {
                            Id = 6, RoomCategory = "Deluxe",RoomNumber = 200,PersonsNumber = 2,Price = 200,
                            Description=new Description(2).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast",
                            State = "Available",Image="deluxe0.jpg"
                        },
                        new Room
                         {
                            Id = 7, RoomCategory = "Deluxe",RoomNumber = 201,PersonsNumber = 2,Price = 200,
                            Description=new Description(2).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast",
                            State = "Available",Image="deluxe1.jpg"
                        },
                        new Room
                        {
                            Id = 8, RoomCategory = "Deluxe",RoomNumber = 202,PersonsNumber = 3,Price = 230,
                            Description=new Description(3).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast",
                            State = "Available",Image="deluxe2.jpg"
                        },
                        new Room
                        {
                            Id = 9, RoomCategory = "Deluxe",RoomNumber = 203,PersonsNumber = 2,Price = 200,
                            Description=new Description(2).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast",
                            State = "Available",Image="deluxe0.jpg"
                        },
                        new Room
                        {
                            Id = 10, RoomCategory = "Deluxe",RoomNumber = 204,PersonsNumber = 3,Price = 230,
                            Description=new Description(3).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast",
                            State = "Available",Image="deluxe1.jpg"
                        },
                        new Room
                        {
                            Id = 11, RoomCategory = "Suite",RoomNumber = 300,PersonsNumber = 3,Price = 250,
                            Description=new Description(4).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System",
                            State = "Available",Image="suite0.jpg"
                        },
                        new Room
                        {
                            Id = 12, RoomCategory = "Suite",RoomNumber = 301,PersonsNumber = 4,Price = 280,
                            Description=new Description(5).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System",
                            State = "Available",Image="suite1.jpg"
                        },
                        new Room
                        {
                            Id = 13, RoomCategory = "Suite",RoomNumber = 302,PersonsNumber = 3,Price = 250,
                            Description=new Description(4).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System",
                            State = "Available",Image="suite2.jpg"
                        },
                        new Room
                        {
                            Id = 14, RoomCategory = "Suite",RoomNumber = 303,PersonsNumber = 4,Price = 280,
                            Description=new Description(5).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System",
                            State = "Available",Image="suite0.jpg"
                        },
                        new Room
                        {
                            Id = 15, RoomCategory = "Suite",RoomNumber = 304,PersonsNumber = 3,Price = 250,
                            Description=new Description(4).Text,Facilities = "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System",
                            State = "Available",Image="suite1.jpg"
                        }});
        }
    }
}


