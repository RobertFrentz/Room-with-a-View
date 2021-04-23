
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Controllers;
using RoomManagementMicroservice.Data;
using Xunit;

namespace RoomManagementTests
{
    public class UnitTests
    {
        [Fact]
        public async void GetRoomsById_TheRoomWithGivenRoomNumberExists_ReturnOkObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "RoomsDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();
            RoomsController roomsController = new RoomsController(new RoomsRepository(context));
            var result = await roomsController.GetRoomByNumberAsync(100);
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async void GetRoomsById_TheRoomWithGivenRoomNumberDoesNotExist_ReturnNotFoundResultObjectAsync()
        {
            //Arrange
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "RoomsDatabase")
                              .Options;
            var context = new DataContext(options);
            await context.Database.EnsureCreatedAsync();

            //Act
            RoomsController roomsController = new RoomsController(new RoomsRepository(context));
            var result = await roomsController.GetRoomByNumberAsync(111);

            //Asert
            Assert.IsType<NotFoundObjectResult>(result);
        }
    }
}
