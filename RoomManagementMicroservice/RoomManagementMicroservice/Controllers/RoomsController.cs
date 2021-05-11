using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using RoomManagementMicroservice.Data;
using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Utils;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Controllers
{
    //token admin: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTkyOTYyNDMsInVzZXJJZCI6Mn0.iDhjcbhbd0V-BxJjgr6rxRd9mhrQBz2XZH2kOK3ohJU
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
            //var verify=await VerifyAuthorization(authorizationToken);
            //if(verify is UnauthorizedObjectResult)
            //{
            //    return verify;
            //}
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
        /*[Route("image")]
        [HttpGet]
        public async Task<IActionResult> GetImage(int roomNumber)
        {
            var image = await System.IO.File.ReadAllBytesAsync(@"Resources\deluxe1.jpg");
            return File(image, "image/jpeg");
        }*/
    }
}
