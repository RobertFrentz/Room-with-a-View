using BookingMicroservice.Repositories;
using BookingMicroservice.DTOs;
using BookingMicroservice.Utils;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Stripe;
using Stripe.Checkout;
using System;
using System.Collections.Generic;
using System.Linq;
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
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            var responseAdminPrivileges = await client.GetAsync(usersManagementMicroserviceUri + "adminPrivileges" + "?json=" + responseAuthorization.Content.ReadAsStringAsync().Result);
            if (responseAdminPrivileges.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAdminPrivileges.Content.ReadAsStringAsync().Result);
            }
            var bookings = await _repository.GetBookingsAsync();
            return Ok(bookings);
        }


        [HttpGet]
        public async Task<IActionResult> GetBookingsByUserIdAsync([FromHeader] string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            var userId = Extract.ExtractUserId(responseAuthorization.Content.ReadAsStringAsync().Result);
            var bookings = await _repository.GetBookingsByUserIdAsync(userId);
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
            if (result == null)
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
            if (!Validation.CheckValidDates(roomSearchDTO.CheckIn, roomSearchDTO.CheckOut))
            {
                return BadRequest(new Error("Check in/check out dates invalid."));
            }
            var httpResultContent = await client.GetStringAsync(roomsManagementMicroserviceUri);
            if (httpResultContent != null)
            {
                List<RoomDescriptionDto>? rooms = JsonConvert.DeserializeObject<List<RoomDescriptionDto>>(httpResultContent);
                if (rooms != null)
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
            var userId = Extract.ExtractUserId(responseAuthorization.Content.ReadAsStringAsync().Result);
            var responseRoomNumber = await client.GetAsync(roomsManagementMicroserviceUri + $"/{postBooking.RoomNumber}");
            int price;
            if (responseRoomNumber.StatusCode == System.Net.HttpStatusCode.NotFound)
            {
                return BadRequest(new Error($"Room with room number {postBooking.RoomNumber} does not exist."));
            }
            Console.WriteLine(responseRoomNumber.Content.ReadAsStringAsync().Result);
            price = Extract.ExtractPrice(responseRoomNumber.Content.ReadAsStringAsync().Result);

            if (!Validation.CheckValidDates(postBooking.CheckIn, postBooking.CheckOut))
            {
                return BadRequest(new Error("Check in/check out dates invalid."));
            }
            StripeConfiguration.ApiKey = "sk_test_51IpzH0EpnVBzkA6JMg0hJipPp1kL46qfg2IP8CjFovMQvkiolWx0PBQ9V7EVKfcX4O31jYXbdD1b71W4IRLscts300rDjslJf0";
            var service = new SessionService();
            service.Get(
              postBooking.SessionId
            );
            var payment = service.Get(
              postBooking.SessionId
            );
            Console.WriteLine(payment);
            if(payment.PaymentStatus=="unpaid")
            {
                return BadRequest(new Error("Transaction not completed."));
            }

            var result = await _repository.AddBookingAsync(postBooking, userId, price);
            if (result == -2)
            {
                return BadRequest(new Error("Booking already exists."));
            }
            if (result == -1)
            {
                return BadRequest(new Error("An existing booking interferes with given CheckIn/CheckOut."));
            }
            var userContent = await client.GetStringAsync(usersManagementMicroserviceUri + userId);
            if (userContent != null)
            {
                UserDescription? user = JsonConvert.DeserializeObject<UserDescription>(userContent);
                MailSystem.SendAddedBookingMail(user.Email, user.Username, postBooking.RoomNumber, postBooking.CheckIn, postBooking.CheckOut);
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
            var userId = Extract.ExtractUserId(responseAuthorization.Content.ReadAsStringAsync().Result);
            var result = await _repository.UpdateBookingAsync(patchBooking, userId);
            if (!Validation.CheckValidDates(patchBooking.CheckIn, patchBooking.CheckOut))
            {
                return BadRequest(new Error("Check in/check out dates invalid."));
            }
            if (result == -2)
            {
                return NotFound(new Error($"Booking with id {patchBooking.Id} does not exist."));
            }
            if (result == -1)
            {
                return BadRequest(new Error("An existing booking interferes with given CheckIn/CheckOut."));
            }
            var userContent = await client.GetStringAsync(usersManagementMicroserviceUri + userId);
            if (userContent != null)
            {
                UserDescription? user = JsonConvert.DeserializeObject<UserDescription>(userContent);
                MailSystem.SendUpdatedBookingMail(user.Email, user.Username, patchBooking.Id, patchBooking.CheckIn, patchBooking.CheckOut);
            }
            return NoContent();
        }

        [Route("available")]
        [HttpGet]
        public async Task<IActionResult> CheckRoomAvailability(int roomNumber, DateTime checkIn, DateTime checkOut)
        {
            var responseRoomNumber = await client.GetAsync(roomsManagementMicroserviceUri + $"/{roomNumber}");
            if (responseRoomNumber.StatusCode == System.Net.HttpStatusCode.NotFound)
            {
                return BadRequest(new Error($"Room with room number {roomNumber} does not exist."));
            }
            if (!Validation.CheckValidDates(checkIn, checkOut))
            {
                return BadRequest(new Error("Check in/check out dates invalid."));
            }
            var isAvailable = await _repository.CheckRoomAvailabilityAsync(roomNumber, checkIn, checkOut);
            return Ok(JsonConvert.SerializeObject(new
            {
                available = isAvailable
            }));
        }

        [HttpGet("roomNumber")]
        public async Task<IActionResult> GetBookingDatesRoomSpecified(int roomNumber)
        {
            var dates = await _repository.GetCheckInCheckOutForSpecificRoom(roomNumber);
            if(dates.Count==0)
            {
                return Ok(dates);
            }
            return Ok(JsonConvert.SerializeObject(new
                { 
                    dates=dates[0],
                    Status=dates[1]
                }));
            }
        }
}
