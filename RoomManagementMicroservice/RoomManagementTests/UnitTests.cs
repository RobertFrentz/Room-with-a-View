
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Controllers;
using RoomManagementMicroservice.Data;
using RoomManagementMicroservice.DTOs;
using System.Linq;
using Xunit;

namespace RoomManagementTests
{
    public class UnitTest
    {

        readonly string AdminJWT = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XL0";
        [Fact]
        public async void GetAllRooms_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetAllRoomsDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.GetRoomsAsync();

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async void GetAllRooms_ReturnNotFoundObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetAllRoomsDatabaseNotFound")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            context.Rooms.RemoveRange(context.Rooms);
            await context.SaveChangesAsync();
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.GetRoomsAsync();

            //Asert
            Assert.IsType<NotFoundObjectResult>(result);
        }
        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async void VerifyAuthorizationForRoomActions_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            //Arrange
            RoomsController roomsController = new();

            //Act
            var result = await roomsController.VerifyAuthorization(authorizationToken);

            //Asert
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async void VerifyAuthorizationForRoomActions_ReturnOkObjectResultAsync()
        {
            //Arrange
            RoomsController roomsController = new();

            //Act
            var result = await roomsController.VerifyAuthorization(AdminJWT);

            //Asert
            Assert.IsType<OkObjectResult>(result);
        }
 
        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async void GetRoomsByNumber_TheRoomWithGivenRoomNumberExists_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetRoomByNumberDatabaseUnauthorized")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.GetRoomByNumberAsync(100, authorizationToken);
            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        

        [Fact]
        public async void GetRoomsByNumber_TheRoomWithGivenRoomNumberDoesNotExist_ReturnNotFoundObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetRoomByNumberNotFoundDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.GetRoomByNumberAsync(111,AdminJWT);

            //Asert
            Assert.IsType<NotFoundObjectResult>(result);
        }

        [Fact]
        public async void GetRoomsByNumber_TheRoomWithGivenRoomNumberExists_ReturnOkObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetRoomByNumberDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.GetRoomByNumberAsync(100, AdminJWT);

            //Assert
            Assert.IsType<OkObjectResult>(result);
        }

        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async void PostRoom_AddSpecificRoom_NoAuthorization_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostRoomDatabaseUnauthorized")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.PostRoomAsync(new PostRoomDto()
            {
                RoomCategory="Standard",
                PersonsNumber=3,
                Description="unit tests",
                Price=1000,
                Facilities="ceva"
            }, authorizationToken);

            //Assert
            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        [Fact]
        public async void PostRoom_AddSpecificRoom_WithAuthorization_ReturnCreatedAtActionResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostRoomDatabaseCreatedAtAction")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.PostRoomAsync(new PostRoomDto()
            {
                RoomCategory = "Standard",
                PersonsNumber = 3,
                Description = "unit tests",
                Price = 1000,
                Facilities = "ceva"
            }, AdminJWT);

            //Assert
            Assert.IsType<CreatedAtActionResult>(result);
        }

        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async void UpdateRoom_NoAuthorization_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateRoomDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            PatchRoomDto patchRoomDto = new()
            {
                PersonsNumber = 2,
                Description = "alabala",
                Price = 200,
                Facilities = "Wi-Fi",
                State = "ReadyToClean"
            };
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.UpdateRoomAsync(111, patchRoomDto, authorizationToken);

            //Asert
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async void UpdateRoom_TheRoomWithGivenRoomNumberDoesNotExist_ReturnNotFoundObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateRoomDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            PatchRoomDto patchRoomDto = new()
            {
                PersonsNumber = 2,
                Description = "alabala",
                Price = 200,
                Facilities = "Wi-Fi",
                State = "ReadyToClean"
            };
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.UpdateRoomAsync(111, patchRoomDto, AdminJWT);

            //Asert
            Assert.IsType<NotFoundObjectResult>(result);
        }
        [Fact]
        public async void UpdateRoom_TheRoomWithGivenRoomNumberIsUpdated_ReturnNoContentObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "UpdateRoomWithGivenNumberDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            PatchRoomDto patchRoomDto = new()
            {
                PersonsNumber = 2,
                Description = "alabala",
                Price = 200,
                Facilities = "Wi-Fi",
                State = "ReadyToClean"
            };
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.UpdateRoomAsync(103, patchRoomDto, AdminJWT);

            //Asert
            Assert.IsType<NoContentResult>(result);
        }
    }
}
