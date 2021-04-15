using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RoomManagementMicroservice.Data;
using RoomManagementMicroservice.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Controllers
{
    [Route("api/v1/rooms")]
    [ApiController]
    public class RoomsController : ControllerBase
    {
        private readonly IRoomsRepository _repository;

        public RoomsController(IRoomsRepository repository)
        {
            _repository = repository;
        }

        [Route("available")]
        [HttpGet]
        public async Task<IActionResult> GetRoomsAvailableAsync([FromQuery] RoomSearch roomSearch)
        {
            IEnumerable<RoomResultSearch> result = await _repository.GetRoomsAvailableAsync(roomSearch);
            Console.WriteLine(result.ElementAt(0));
            if(result==null)
            {
                return NotFound();
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                roomsAvailable = result
            }));
        }

        [HttpGet]

        public async Task<IActionResult> GetRoomsAsync()
        {
            IEnumerable<RoomResultSearch> result = await _repository.GetRoomsAsync();
            if (result == null)
            {
                return NotFound();
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                rooms = result
            }));
        }


        [HttpGet("{id}")]

        public async Task<IActionResult> GetRoomByIdAsync(int id)
        {
            RoomDescription result = await _repository.GetRoomByIdAsync(id);
            if( result ==null)
            {
                return NotFound();
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                room = result
            }));
        }
    }
}
