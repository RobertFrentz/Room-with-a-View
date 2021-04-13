using Microsoft.AspNetCore.Mvc;
using RoomManagementMicroservice.Data;
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

        [HttpPost]

        public async Task<IActionResult> GetRoomsAvailableAsync([FromBody] RoomSearch roomSearch)
        {
            IEnumerable<RoomSearch> result = await _repository.GetRoomsAvailableAsync(roomSearch);
            if(result==null)
            {
                return NotFound();
            }
            return Ok(result);
        }

        [HttpGet]

        public async Task<IActionResult> GetRoomsAsync()
        {
            IEnumerable<RoomDescription> result = await _repository.GetRoomsAsync();
            if(result==null)
            {
                return NotFound();
            }
            return Ok(result);
        }
    }
}
