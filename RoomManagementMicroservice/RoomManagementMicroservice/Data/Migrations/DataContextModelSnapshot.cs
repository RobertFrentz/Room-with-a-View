﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using RoomManagementMicroservice.Data;

namespace RoomManagementMicroservice.Data.Migrations
{
    [DbContext(typeof(DataContext))]
    partial class DataContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.0-preview.3.21201.2");

            modelBuilder.Entity("RoomManagementMicroservice.Entities.Room", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<DateTime?>("CheckIn")
                        .HasColumnType("TEXT");

                    b.Property<DateTime?>("CheckOut")
                        .HasColumnType("TEXT");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.Property<string>("Facilities")
                        .HasColumnType("TEXT");

                    b.Property<int>("PersonsNumber")
                        .HasColumnType("INTEGER");

                    b.Property<int>("Price")
                        .HasColumnType("INTEGER");

                    b.Property<string>("RoomCategory")
                        .HasColumnType("TEXT");

                    b.Property<string>("State")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Rooms");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Description = "blabla",
                            Facilities = "Wi-Fi,Apa calda,Aer",
                            PersonsNumber = 2,
                            Price = 100,
                            RoomCategory = "Standard",
                            State = "Available"
                        },
                        new
                        {
                            Id = 2,
                            CheckIn = new DateTime(2021, 4, 10, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            CheckOut = new DateTime(2021, 4, 13, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            Description = "blabla",
                            Facilities = "Wi-Fi,Apa calda,Aer",
                            PersonsNumber = 3,
                            Price = 170,
                            RoomCategory = "Standard",
                            State = "Booked"
                        },
                        new
                        {
                            Id = 3,
                            CheckIn = new DateTime(2021, 4, 14, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            CheckOut = new DateTime(2021, 4, 16, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            Description = "blabla",
                            Facilities = "Wi-Fi,Apa calda,Aer",
                            PersonsNumber = 3,
                            Price = 130,
                            RoomCategory = "Standard",
                            State = "Booked"
                        },
                        new
                        {
                            Id = 4,
                            CheckIn = new DateTime(2021, 4, 6, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            CheckOut = new DateTime(2021, 4, 9, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            Description = "blabla",
                            Facilities = "Wi-Fi,Apa calda,Aer",
                            PersonsNumber = 2,
                            Price = 150,
                            RoomCategory = "Standard",
                            State = "Booked"
                        });
                });
#pragma warning restore 612, 618
        }
    }
}
