﻿using BookingMicroservice.Data;
using BookingMicroservice.DTOs;
using BookingMicroservice.Utils;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace BookingMicroservice.Controllers
{
    [Route("api/v1/bookings")]
    [ApiController]
    public class BookingsController : ControllerBase
    {
        private readonly IBookingsRepository _repository;
        private readonly HttpClient client;
        private readonly string usersManagementMicroserviceUri = "http://localhost:60094/api/v1/users/";
        private readonly string roomsManagementMicroserviceUri = "http://localhost:19008/api/v1/rooms";
        public BookingsController(IBookingsRepository repository)
        {
            _repository = repository;
            client = new HttpClient();
        }

        [Route("all")]
        [HttpGet]
        public async Task<IActionResult> GetBookings([FromHeader] string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri+"authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            var bookings = await _repository.GetBookings();
            return Ok(bookings);
        }


        [HttpGet]
        public async Task<IActionResult> GetBookingsByUserId([FromHeader] string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            var userId = ExtractId.ExtractUserId(responseAuthorization.Content.ReadAsStringAsync().Result);
            var bookings = await _repository.GetBookingsByUserId(userId);
            if (!bookings.Any())
            {
                return NotFound(new Error("You have no bookings."));
            }
            return Ok(bookings);
        }

        [HttpGet("id")]
        public async Task<IActionResult> GetBookingByIdAsync(int id, [FromHeader] string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            var result = await _repository.GetBookingByIdAsync(id);
            if(result == null)
            {
                return NotFound(new Error($"Booking with id {id} does not exist."));
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                Id = result.Id,
                RoomNumber = result.RoomNumber,
                CheckIn = result.CheckIn,
                CheckOut = result.CheckOut,
                TotalPay = result.TotalPay,
                Status = result.Status
            }));
        }
        [Route("search")]
        [HttpGet]
        public async Task<IActionResult> SearchAvailableRoomsAsync([FromQuery] RoomSearchDto roomSearchDTO)
        {
            
            var httpResultContent = await client.GetStringAsync(roomsManagementMicroserviceUri);
            if(httpResultContent!=null)
            {
                List<RoomDescriptionDto>? rooms = JsonConvert.DeserializeObject<List<RoomDescriptionDto>>(httpResultContent);
                if(rooms!=null)
                {
                    var result = _repository.SearchAvailableRoomsAsync(roomSearchDTO, rooms);
                    if (result == null)
                    {
                        return NotFound(new Error("No rooms available"));
                    }
                    return Ok(JsonConvert.SerializeObject(new
                    {
                        rooms = result.Result
                    }));
                }
               
            }
            return NotFound(new Error("No rooms found."));
        }

        [HttpPost]
        public async Task<IActionResult> AddBookingAsync([FromBody] PostBookingDto postBooking, [FromHeader] string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            var result = await _repository.AddBookingAsync(postBooking);
            if(result == -2)
            {
                return BadRequest(new Error("Booking already exists."));
            }
            if(result == -1)
            {
                return BadRequest(new Error("An existing booking interferes with given CheckIn/CheckOut."));
            }
            return CreatedAtAction("AddBooking", postBooking);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateBookingAsync([FromBody] PatchBookingDto patchBooking, [FromHeader] string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            var result = await _repository.UpdateBookingAsync(patchBooking);
            if(result == -2) 
            {
                return NotFound(new Error($"Booking with id {patchBooking.Id} does not exist."));
            }
            if(result == -1)
            {
                return BadRequest(new Error("An existing booking interferes with given CheckIn/CheckOut."));
            }
            return NoContent();
        }
    }
}
