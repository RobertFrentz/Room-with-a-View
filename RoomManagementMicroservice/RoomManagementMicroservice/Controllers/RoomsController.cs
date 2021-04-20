using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RoomManagementMicroservice.Data;
using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Entities;
using RoomManagementMicroservice.Utils;
using System.Collections.Generic;
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

        /*[Route("available")]
        [HttpGet]
        public async Task<IActionResult> GetRoomsAvailableAsync([FromQuery] RoomSearch roomSearch)
        {
            IEnumerable<RoomResultSearch> result = await _repository.GetRoomsAvailableAsync(roomSearch);

            if(result.Count()==0)
            {
                return NotFound(new Error("There isn't any room with these properties."));
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                roomsAvailable = result
            }));
        }*/

        [HttpGet]

        public async Task<IActionResult> GetRoomsAsync()
        {
            IEnumerable<RoomDescription> result = await _repository.GetRoomsAsync();
            if (result == null)
            {
                return NotFound(new Error("No rooms"));
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                rooms = result
            }));
        }


        

        [HttpGet("{roomNumber}")]

        public async Task<IActionResult> GetRoomByNumberAsync(int roomNumber)
        {
            RoomDescription result = await _repository.GetRoomByNumberAsync(roomNumber);
            if( result == null)
            {
                return NotFound(new Error("The room with that number does not exist."));
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                room = result
            }));
        }
        [Route("addRoom")]
        [HttpPost]

        public async Task<IActionResult> AddRoomAsync([FromBody] RoomToAdd roomToAdd)
        {
            var result = await _repository.AddRoomAsync(roomToAdd);
            return CreatedAtAction("addRoom", roomToAdd);
        }

        /*[HttpPatch("{roomNumber}")]
        public async Task<IActionResult> ModifyRoomAttributesAsync(int roomNumber, [FromBody] List<RoomDescription> patchDto)
        {
            var room = await _repository.GetRoomByNumberAsync(roomNumber);

            if (room == null)
            {
                return NotFound();
            }

            await _repository.ModifyRoomAttributesAsync(room, patchDto);

            return NoContent();
        }*/
    }
}
