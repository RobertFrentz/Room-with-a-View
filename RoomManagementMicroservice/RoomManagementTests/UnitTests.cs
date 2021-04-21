
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
        public async void GetRoomsById_TheRoomWithGivenIdExists_ReturnOkObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "RoomsDatabase")
                              .Options;
            var context = new DataContext(options);
            RoomsController roomsController = new RoomsController(new RoomsRepository(context));
            var result = await roomsController.GetRoomByNumberAsync(100);
            Assert.IsType<OkObjectResult>(result);
        }
    }
}
