using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Repositories;
using RoomManagementMicroservice.Utils;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Controllers
{
    [Route("api/v1/rooms")]
    [ApiController]
    public class RoomsController : ControllerBase
    {
        private readonly IRoomsRepository _repository;
        private readonly HttpClient client;
        private readonly string usersManagementMicroserviceUri = "http://localhost:60094/api/v1/users/";

        [ActivatorUtilitiesConstructor]
        public RoomsController(IRoomsRepository repository)
        {
            _repository = repository;
            client = new HttpClient();
        }

        public RoomsController()
        {
            client = new HttpClient();
        }
        [HttpGet]

        public async Task<IActionResult> GetRoomsAsync()
        {
            IEnumerable<RoomDescriptionDto> result = await _repository.GetRoomsAsync();
            if (!result.Any())
            {
                return NotFound(new Error("No rooms"));
            }

            return Ok(result);
        }

        [Route("verify")]
        [HttpGet]
        public async Task<IActionResult> VerifyAuthorization(string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            return Ok(responseAuthorization.Content.ReadAsStringAsync().Result);
        }

        [HttpGet("{roomNumber}")]

        public async Task<IActionResult> GetRoomByNumberAsync(int roomNumber, [FromHeader] string authorizationToken)
        {
            RoomDescriptionDto result = await _repository.GetRoomByNumberAsync(roomNumber);
            if( result == null)
            {
                return NotFound(new Error("The room with that number does not exist."));
            }
            RoomDescriptionDto roomDescription = new RoomDescriptionDto()
            {
                RoomCategory = result.RoomCategory,
                RoomNumber = result.RoomNumber,
                Description = result.Description,
                Facilities = result.Facilities,
                PersonsNumber = result.PersonsNumber,
                Price = result.Price,
                Image = result.Image
            };
            return Ok(JsonConvert.SerializeObject(new
            {
                room = roomDescription
            }));
        }

        [Route("addRoom")]
        [HttpPost]

        public async Task<IActionResult> PostRoomAsync([FromBody] PostRoomDto roomToAdd , [FromHeader] string authorizationToken)
        {
            var verify = await VerifyAuthorization(authorizationToken);
            if (verify is UnauthorizedObjectResult)
            {
                return verify;
            }
            await _repository.AddRoomAsync(roomToAdd);
            return CreatedAtAction("addRoom", roomToAdd);
        }

        [HttpPatch("{roomNumber}")]
        public async Task<IActionResult> UpdateRoomAsync(int roomNumber, [FromBody] PatchRoomDto patchRoomDto , [FromHeader] string authorizationToken)
        {
            var verify = await VerifyAuthorization(authorizationToken);
            if (verify is UnauthorizedObjectResult)
            {
                return verify;
            }
            var result = await _repository.UpdateAsync(roomNumber,patchRoomDto);
            if(result==-1)
            {
                return NotFound(new Error($"The room with number {roomNumber} was not found."));
            }
            return NoContent();
            
        }
    }
}