using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RoomManagementMicroservice.Data;
using RoomManagementMicroservice.DTOs;
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
            IEnumerable<RoomDescriptionDTO> result = await _repository.GetRoomsAsync();
            if (result == null)
            {
                return NotFound(new Error("No rooms"));
            }
            /*return Ok(JsonConvert.SerializeObject(new
            {
                rooms = result
            }));*/
            return Ok(result);
        }


        //formula generare room number (nr.camerere / 10) + 1 * 100 + nr.camere % 10

        [HttpGet("{roomNumber}")]

        public async Task<IActionResult> GetRoomByNumberAsync(int roomNumber)
        {
            RoomDescriptionDTO result = await _repository.GetRoomByNumberAsync(roomNumber);
            if( result == null)
            {
                return NotFound(new Error("The room with that number does not exist."));
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                room = result
            }));
        }
    }
}
