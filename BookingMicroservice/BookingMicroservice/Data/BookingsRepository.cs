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

        public async Task<IEnumerable<Booking>> GetBookings()
        {
            return await _context.Bookings.ToListAsync();
        }
        public async Task<IEnumerable<Booking>> GetBookingsByUserId(int userId)
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

        public async Task<int> AddBookingAsync(PostBookingDto postBooking)
        {
            var result = await _context.Bookings.AnyAsync(booking => booking.RoomNumber == postBooking.RoomNumber && booking.CheckIn == postBooking.CheckIn
                                                          && booking.CheckOut == postBooking.CheckOut && booking.UserId == postBooking.UserId);
            if(result)
            {
                return -2;
            }
            var isAddingNotPossible = await CheckRoomAvailability(postBooking.RoomNumber, postBooking.CheckIn, postBooking.CheckOut);
            if (isAddingNotPossible)
            {
                _context.Add(new Booking()
                {
                    Id = 0,
                    RoomNumber = postBooking.RoomNumber,
                    CheckIn = postBooking.CheckIn,
                    CheckOut = postBooking.CheckOut,
                    UserId = postBooking.UserId,
                    TotalPay = 100,
                    Status = "Registered"

                });
                await _context.SaveChangesAsync();
                return 0;
            }
            return -1;
        }

        public async Task<int> UpdateBookingAsync(PatchBookingDto patchBooking)
        {
            var result = await _context.Bookings.Where(booking => booking.Id == patchBooking.Id).FirstOrDefaultAsync();
            if (result == null)
            {
                return -2;
            }
            int roomNumber = result.RoomNumber;
            var isUpdateNotPossible = await CheckRoomAvailability(roomNumber, patchBooking.CheckIn, patchBooking.CheckOut);
            if (isUpdateNotPossible)
            {
                return -1;
            }
            result.CheckIn = patchBooking.CheckIn;
            result.CheckOut = patchBooking.CheckOut;
            await _context.SaveChangesAsync();
            return 0;
            

        }

        public async Task<IEnumerable<RoomDescriptionDto>> SearchAvailableRoomsAsync(RoomSearchDto roomSearchDTO, List<RoomDescriptionDto> rooms)
        {
            List<RoomDescriptionDto> returnValue = new List<RoomDescriptionDto>();
            foreach(var room in rooms)
            {
                if(room.PersonsNumber != roomSearchDTO.PersonsNumber)
                {
                    continue;
                }
                var isReserved = await CheckRoomAvailability(room.RoomNumber, roomSearchDTO.CheckIn, roomSearchDTO.CheckOut);
                if (isReserved)
                {
                    continue;
                }
                returnValue.Add(room);
            }
            return returnValue;
        }

        public async Task<bool> CheckRoomAvailability(int roomNumber, DateTime? checkIn, DateTime? checkOut)
        {
            var isReserved = await _context.Bookings.AnyAsync(booking => booking.RoomNumber == roomNumber &&
                                                     ((booking.CheckIn > checkIn && booking.CheckOut < checkOut) ||
                                                      (booking.CheckIn < checkIn && checkIn < booking.CheckOut && checkOut > booking.CheckOut) ||
                                                      (booking.CheckIn > checkIn && booking.CheckIn < checkOut && checkOut < booking.CheckOut) ||
                                                      (booking.CheckIn < checkIn && booking.CheckOut > checkOut)));
            return !isReserved;
        }
    }
}
