using BookingMicroservice.Data;
using BookingMicroservice.DTOs;
using BookingMicroservice.Utils;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace BookingMicroservice.Controllers
{
    [Route("api/v1/bookings")]
    [ApiController]
    public class BookingsController : ControllerBase
    {
        private readonly IBookingsRepository _repository;
        private readonly HttpClient client;

        public BookingsController(IBookingsRepository repository)
        {
            _repository = repository;
            client = new HttpClient();
        }

        [HttpGet]
        public async Task<IActionResult> GetBookings()
        {
            var bookings = await _repository.GetBookings();
            return Ok(bookings);
        }

        [HttpGet("id")]
        public async Task<IActionResult> GetBookingByIdAsync(int id)
        {
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
        public async Task<IActionResult> SearchAvailableRoomsAsync([FromQuery] RoomSearchDTO roomSearchDTO)
        {
            var httpResultContent = await client.GetStringAsync("http://localhost:19008/api/v1/rooms");
            List<RoomDescriptionDTO> rooms = JsonConvert.DeserializeObject<List<RoomDescriptionDTO>>(httpResultContent);
            var result = _repository.SearchAvailableRoomsAsync(roomSearchDTO, rooms);
            if(result == null)
            {
                return NotFound(new Error("No rooms available"));
            }
            return Ok(JsonConvert.SerializeObject(new
            {
                availableRoomsNumber = result.Result
            })) ;
        }

        [HttpPost]
        public async Task<IActionResult> AddBookingAsync([FromBody] PostBookingDTO postBooking)
        {
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
        public async Task<IActionResult> UpdateBookingAsync([FromBody] PatchBookingDTO patchBooking)
        {
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
