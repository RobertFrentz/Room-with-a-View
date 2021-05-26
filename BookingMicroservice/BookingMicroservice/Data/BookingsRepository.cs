using BookingMicroservice.DTOs;
using BookingMicroservice.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookingMicroservice.Data
{
    public class BookingsRepository : IBookingsRepository
    {
        private readonly DataContext _context;

        public BookingsRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Booking>> GetBookingsAsync()
        {
            return await _context.Bookings.ToListAsync();
        }
        public async Task<IEnumerable<Booking>> GetBookingsByUserIdAsync(int userId)
        {
            return await _context.Bookings.Where(booking => booking.UserId==userId).ToListAsync();
        }
        public async Task<GetBookingDto?> GetBookingByIdAsync(int id)
        {
            var result = await _context.Bookings.Where(booking => booking.Id == id).FirstOrDefaultAsync();
            if (result == null)
            {
                return null;
            }
            return new GetBookingDto()
            {
                Id = result.Id,
                RoomNumber = result.RoomNumber,
                CheckIn = result.CheckIn,
                CheckOut = result.CheckOut,
                TotalPay = result.TotalPay,
                Status = result.Status
            };
        }

        public async Task<int> AddBookingAsync(PostBookingDto postBooking, int userId, int price)
        {

            var result = await _context.Bookings.AnyAsync(booking => booking.RoomNumber == postBooking.RoomNumber && booking.CheckIn == postBooking.CheckIn
                                                          && booking.CheckOut == postBooking.CheckOut && booking.UserId == userId);
            if(result)
            {
                return -2;
            }
            int totalPay = price * (postBooking.CheckOut - postBooking.CheckIn).Days;
            var isAddingPossible = await CheckRoomAvailabilityAsync(postBooking.RoomNumber, postBooking.CheckIn, postBooking.CheckOut);
            if (isAddingPossible)
            {
                _context.Add(new Booking()
                {
                    Id = 0,
                    RoomNumber = postBooking.RoomNumber,
                    CheckIn = postBooking.CheckIn,
                    CheckOut = postBooking.CheckOut,
                    UserId = userId,
                    TotalPay = totalPay,
                    Status = "Registered"

                });
                await _context.SaveChangesAsync();
                return 0;
            }
            return -1;
        }

        public async Task<int> UpdateBookingAsync(PatchBookingDto patchBooking, int userId)
        {
            var result = await _context.Bookings.Where(booking => booking.Id == patchBooking.Id && booking.UserId == userId).FirstOrDefaultAsync();
            if (result == null)
            {
                return -2;
            }
            int roomNumber = result.RoomNumber;
            var isUpdateNotPossible = await _context.Bookings.AnyAsync(booking => booking.Id != patchBooking.Id && booking.RoomNumber == roomNumber && 
                                                     ((booking.CheckIn > patchBooking.CheckIn && booking.CheckOut < patchBooking.CheckOut) ||
                                                      (booking.CheckIn < patchBooking.CheckIn && patchBooking.CheckIn < booking.CheckOut && patchBooking.CheckOut > booking.CheckOut) ||
                                                      (booking.CheckIn > patchBooking.CheckIn && booking.CheckIn < patchBooking.CheckOut && patchBooking.CheckOut < booking.CheckOut) ||
                                                      (booking.CheckIn == patchBooking.CheckIn || booking.CheckOut == patchBooking.CheckOut) ||
                                                      (booking.CheckIn < patchBooking.CheckIn && booking.CheckOut > patchBooking.CheckOut)));
            if (isUpdateNotPossible)
            {
                return -1;
            }
            result.CheckIn = patchBooking.CheckIn;
            result.CheckOut = patchBooking.CheckOut;
            result.Status = "Updated";
            await _context.SaveChangesAsync();
            return 0;
            

        }

        public async Task<IEnumerable<RoomDescriptionDto>> SearchAvailableRoomsAsync(RoomSearchDto roomSearchDTO, List<RoomDescriptionDto> rooms)
        {
            List<RoomDescriptionDto> returnValue = new List<RoomDescriptionDto>();
            foreach(var room in rooms)
            {
                if(room.PersonsNumber != roomSearchDTO.PersonsNumber || room.RoomCategory != roomSearchDTO.RoomCategory)
                {
                    continue;
                }
                var isAvailable = await CheckRoomAvailabilityAsync(room.RoomNumber, roomSearchDTO.CheckIn, roomSearchDTO.CheckOut);
                if (!isAvailable)
                {
                    continue;
                }
                returnValue.Add(room);
            }
            return returnValue;
        }

        public async Task<bool> CheckRoomAvailabilityAsync(int roomNumber, DateTime? checkIn, DateTime? checkOut)
        {
            var isReserved = await _context.Bookings.AnyAsync(booking => booking.RoomNumber == roomNumber &&
                                                     ((booking.CheckIn > checkIn && booking.CheckOut < checkOut) ||
                                                      (booking.CheckIn < checkIn && checkIn < booking.CheckOut && checkOut > booking.CheckOut) ||
                                                      (booking.CheckIn > checkIn && booking.CheckIn < checkOut && checkOut < booking.CheckOut) ||
                                                      (booking.CheckIn == checkIn || booking.CheckOut == checkOut) ||
                                                      (booking.CheckIn < checkIn && booking.CheckOut > checkOut)));
            return !isReserved;
        }

        public async Task<IEnumerable<object>> GetCheckInCheckOutForSpecificRoom(int roomNumber)
        {
            
            var dates = await _context.Bookings.Where(booking => booking.RoomNumber == roomNumber && booking.CheckOut>=DateTime.Now).Select(booking =>
               new DateInterval()
               {
                   CheckIn = booking.CheckIn,
                   CheckOut = booking.CheckOut
               }).OrderBy(date => date.CheckIn).ToListAsync();
            if(dates.Count == 0)
            {
                return dates;
            }
            var items = new List<object>();
            items.Add(dates);
            if(DateTime.Now>=dates[0].CheckIn)
            {
                items.Add("Booked");
            }
            else
            {
                items.Add("Available");
            }
            return items;
        }
    }
}
