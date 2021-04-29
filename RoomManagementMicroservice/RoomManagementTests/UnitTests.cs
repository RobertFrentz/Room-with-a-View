
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Controllers;
using RoomManagementMicroservice.Data;
using RoomManagementMicroservice.DTOs;
using Xunit;

namespace RoomManagementTests
{
    public class UnitTests
    {

        readonly string AdminJWT = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XL0";
        [Fact]
        public async void GetRoomsById_TheRoomWithGivenRoomNumberExists_ReturnOkObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetRoomByIdDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.GetRoomByNumberAsync(100,AdminJWT);
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async void GetRoomsById_TheRoomWithGivenRoomNumberDoesNotExist_ReturnNotFoundObjectResultAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetRoomByIdNotFoundDatabase")
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
                PersonsNumber=2,
                Description="alabala",
                Price=200,
                Facilities="Wi-Fi",
                State="ReadyToClean"
            };
            RoomsController roomsController = new(new RoomsRepository(context));
            var result = await roomsController.UpdateRoomAsync(103,patchRoomDto,AdminJWT);

            //Asert
            Assert.IsType<NoContentResult>(result);
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
    }
}
