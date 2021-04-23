using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RoomManagementMicroservice.Data;
using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Utils;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Controllers
{
    //token admin: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTkyOTYyNDMsInVzZXJJZCI6Mn0.iDhjcbhbd0V-BxJjgr6rxRd9mhrQBz2XZH2kOK3ohJU
    [Route("api/v1/rooms")]
    [ApiController]
    public class RoomsController : ControllerBase
    {
        private readonly IRoomsRepository _repository;

        public RoomsController(IRoomsRepository repository)
        {
            _repository = repository;
        }

        

        [HttpGet]

        public async Task<IActionResult> GetRoomsAsync()
        {
            IEnumerable<RoomDescriptionDto> result = await _repository.GetRoomsAsync();
            if (result == null)
            {
                return NotFound(new Error("No rooms"));
            }

            return Ok(result);
        }


        

        [HttpGet("{roomNumber}")]

        public async Task<IActionResult> GetRoomByNumberAsync(int roomNumber)
        {
            RoomDescriptionDto result = await _repository.GetRoomByNumberAsync(roomNumber);
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

        public async Task<IActionResult> PostRoomAsync([FromBody] PostRoomDto roomToAdd)
        {
            await _repository.AddRoomAsync(roomToAdd);
            return CreatedAtAction("addRoom", roomToAdd);
        }

        [HttpPatch("{roomNumber}")]
        public async Task<IActionResult> UpdateRoomAsync(int roomNumber, [FromBody] PatchRoomDto patchRoomDto)
        {
            var result = await _repository.UpdateAsync(roomNumber,patchRoomDto);
            if(result==-1)
            {
                return NotFound(new Error($"The room with number {roomNumber} was not found."));
            }
            return NoContent();
            
        }
    }
}
