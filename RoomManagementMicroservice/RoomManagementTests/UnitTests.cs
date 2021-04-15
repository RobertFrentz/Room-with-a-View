
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.Controllers;
using RoomManagementMicroservice.Data;
using System;
using Xunit;

namespace RoomManagementTests
{
    public class UnitTests
    {
        [Fact]
        public void GetRoomsById_TheRoomWithGivenIdExists_ReturnOkObjectResult()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "RoomsDatabase")
                              .Options;
            var context = new DataContext(options);
            RoomsController roomsController = new RoomsController(new RoomsRepository(context));
            var result = roomsController.GetRoomByIdAsync(1).Result;
            Assert.IsType<OkObjectResult>(result);
        }
    }
}
