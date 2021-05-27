using BookingMicroservice.Controllers;
using BookingMicroservice.Repositories;
using BookingMicroservice.DTOs;
using BookingMicroservice.Utils;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;
using Xunit;

namespace BookingTests
{
    public class UnitTests
    {
        
        [Fact]
        public async Task GetAllBookings_ValidAuthorization_ReturnOkObjectResultAsync()
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
        public async Task GetAllBookings_InvalidAuthorization_ReturnUnObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetAllBookingsInvalidTokenDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Invalid");

            //Act
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookings(authorizationToken);

            //Asert
            //output.WriteLine(result.ToString()) ;
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async Task GetBookingsByUserId_ValidAuthorization_ReturnOkObjectResultAsync()
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
        public async Task GetBookingsByUserId_InvalidAuthorization_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetBookingsByUserIdDatabaseInvalidToken")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Invalid");

            //Act
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookingsByUserIdAsync(authorizationToken);

            //Asert
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async Task GetBookingsByBookingId_InvalidAuthorization_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetBookingsByInvalidAuthDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Invalid");

            //Act
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookingByIdAsync(1, authorizationToken);

            //Asert
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async Task GetBookingsByBookingId_NoIdInDatabase_ReturnNotFoundObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetBookingsByInvalidIdDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookingByIdAsync(6, authorizationToken);

            //Asert
            Assert.IsType<NotFoundObjectResult>(result);
        }

        [Fact]
        public async Task GetBookingsByBookingId_ValidAuthorization_ReturnOkObjectResultAsync()
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
        public async Task SearchAvailableRoom_InvalidDates_ReturnBadRequestObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "SearchAvailableRoomDatabaseInvalidDates")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();


            //Act
            RoomSearchDto roomSearchDto = new RoomSearchDto()
            {
                RoomCategory = "Standard",
                CheckIn = new DateTime(2021, 05, 30),
                CheckOut = new DateTime(2021, 05, 25),
                PersonsNumber = 2
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.SearchAvailableRoomsAsync(roomSearchDto);

            //Asert
            Assert.IsType<BadRequestObjectResult>(result);
        }


        [Fact]
        public async Task SearchAvailableRoom_ValidDates_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "SearchAvailableRoomDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();


            //Act
            RoomSearchDto roomSearchDto = new RoomSearchDto()
            {
                RoomCategory = "Standard",
                CheckIn = new DateTime(2021, 06, 25),
                CheckOut = new DateTime(2021, 06, 30),
                PersonsNumber = 2
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.SearchAvailableRoomsAsync(roomSearchDto);

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task AddBooking_ValidAuthorization_ReturnOkObjectResultAsync()
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
                SessionId= "cs_test_a1zQYCu7hLbmNik0NJ34lIwU7Tlkb3HtQkjHriwHv3tuPfoYmFMpcz6nzk"
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.AddBookingAsync(postBookingDto, authorizationToken);

            //Asert
            Assert.IsType<CreatedAtActionResult>(result);
        }

        [Fact]
        public async Task UpdateBooking_InvalidAuthorization_ReturnUnauthorizedObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateBookingDatabaseUnauthorized")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Invalid");

            //Act
            PatchBookingDto patchBookingDto = new PatchBookingDto()
            {
                Id = 1,
                CheckIn = new DateTime(2021, 06, 21),
                CheckOut = new DateTime(2021, 06, 22)
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.UpdateBookingAsync(patchBookingDto, authorizationToken);

            //Asert
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async Task UpdateBooking_InvalidDates_ReturnBadRequestObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateBookingDatabaseInvalidDates")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            PatchBookingDto patchBookingDto = new PatchBookingDto()
            {
                Id = 1,
                CheckIn = new DateTime(2021, 05, 28),
                CheckOut = new DateTime(2021, 05, 26)
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.UpdateBookingAsync(patchBookingDto, authorizationToken);

            //Asert
            Assert.IsType<BadRequestObjectResult>(result);
        }


        [Fact]
        public async Task UpdateBooking_ReturnNotFoundObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateBookingDatabaseNotFound")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            PatchBookingDto patchBookingDto = new PatchBookingDto()
            {
                Id = 7,
                CheckIn = new DateTime(2021, 05, 26),
                CheckOut = new DateTime(2021, 05, 28)
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.UpdateBookingAsync(patchBookingDto, authorizationToken);

            //Asert
            Assert.IsType<NotFoundObjectResult>(result);
        }

        [Fact]
        public async Task UpdateBooking_ExistingBooking_ReturnBadRequestObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateBookingDatabaseBadRequest")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            GenerateData generateData = new(context);
            string authorizationToken = generateData.SeedDataAndGetToken("Valid");

            //Act
            PatchBookingDto patchBookingDto = new PatchBookingDto()
            {
                Id = 2,
                CheckIn = new DateTime(2021, 04, 28),
                CheckOut = new DateTime(2021, 04, 30)
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.UpdateBookingAsync(patchBookingDto, authorizationToken);

            //Asert
            Assert.IsType<BadRequestObjectResult>(result);
        }

        [Fact]
        public async Task UpdateBooking_ValidAuthorization_ReturnNoContentResultAsync()
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
                CheckIn = new DateTime(2021, 06, 21),
                CheckOut = new DateTime(2021, 06, 22)
            };
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.UpdateBookingAsync(patchBookingDto, authorizationToken);

            //Asert
            Assert.IsType<NoContentResult>(result);
        }

        [Theory]
        [InlineData(104)]
        public async Task GetBookingDates_NoBookings_ReturnOkObjectResultAsync(int roomNumber)
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetBookingDatesNoBookingsDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            
            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookingDatesRoomSpecified(roomNumber);

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }

        [Theory]
        [InlineData(201)]
        [InlineData(202)]
        public async Task GetBookingDates_ReturnOkObjectResultAsync(int roomNumber)
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetBookingDatesDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act

            BookingsController bookingsController = new BookingsController(new BookingsRepository(context));
            var result = await bookingsController.GetBookingDatesRoomSpecified(roomNumber);

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }
    }
}
