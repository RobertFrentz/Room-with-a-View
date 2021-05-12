using BookingMicroservice.Controllers;
using BookingMicroservice.Data;
using BookingMicroservice.DTOs;
using BookingMicroservice.Utils;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using Xunit;

namespace BookingTests
{
    public class UnitTests
    {
        
        [Fact]
        public async void GetAllBookings_ValidAuthorization_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetAllBookingsValidTokenDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken=generateData.SeedDataAndGetToken("Valid");

            //Act
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookings(authorizationToken);

            //Asert
            //output.WriteLine(result.ToString()) ;
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async void GetBookingsByUserId_ValidAuthorization_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetBookingsByUserIdDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookingsByUserIdAsync(authorizationToken);

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async void GetBookingsByBookingId_ValidAuthorization_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetBookingsByValidIdDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookingByIdAsync(1, authorizationToken);

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async void SearchAvailableRoom_ValidAuthorization_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "SearchAvailableRoomDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            RoomSearchDto roomSearchDto = new RoomSearchDto()
            {
                RoomCategory = "Standard",
                CheckIn = new DateTime(2021, 05, 20),
                CheckOut = new DateTime(2021, 05, 25),
                PersonsNumber = 2
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.SearchAvailableRoomsAsync(roomSearchDto);

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async void AddBooking_ValidAuthorization_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "AddBookingDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            PostBookingDto postBookingDto = new PostBookingDto()
            {
                RoomNumber = 104,
                CheckIn = new DateTime(2021, 06, 01),
                CheckOut = new DateTime(2021, 06, 06),
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.AddBookingAsync(postBookingDto, authorizationToken);

            //Asert
            Assert.IsType<CreatedAtActionResult>(result);
        }

        [Fact]
        public async void UpdateBooking_ValidAuthorization_ReturnNoContentResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateBookingDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            PatchBookingDto patchBookingDto = new PatchBookingDto()
            {
                Id = 1,
                CheckIn = new DateTime(2021, 05, 21),
                CheckOut = new DateTime(2021, 05, 22)
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.UpdateBookingAsync(patchBookingDto, authorizationToken);

            //Asert
            Assert.IsType<NoContentResult>(result);
        }
    }
}
