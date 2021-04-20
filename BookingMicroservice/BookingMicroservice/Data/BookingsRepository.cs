using BookingMicroservice.DTOs;
using BookingMicroservice.Entities;
using Microsoft.EntityFrameworkCore;
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
        public async Task<GetBookingDTO> GetBookingByIdAsync(int id)
        {
            var result = await _context.Bookings.Where(booking => booking.Id == id).FirstOrDefaultAsync();
            if (result == null)
            {
                return null;
            }
            return new GetBookingDTO()
            {
                Id = result.Id,
                RoomNumber = result.RoomNumber,
                CheckIn = result.CheckIn,
                CheckOut = result.CheckOut,
                TotalPay = result.TotalPay,
                Status = result.Status
            };
        }

        public async Task<int> AddBookingAsync(PostBookingDTO postBooking)
        {
            var result = await _context.Bookings.AnyAsync(booking => booking.RoomNumber == postBooking.RoomNumber && booking.CheckIn == postBooking.CheckIn
                                                          && booking.CheckOut == postBooking.CheckOut && booking.UserId == postBooking.UserId);
            if(result == true)
            {
                return -2;
            }
            var isAddingPossible = await _context.Bookings.AnyAsync(booking => !(booking.RoomNumber == postBooking.RoomNumber && 
                                                     ((booking.CheckIn > postBooking.CheckIn && booking.CheckOut < postBooking.CheckOut) ||
                                                      (booking.CheckIn < postBooking.CheckIn && booking.CheckOut < postBooking.CheckOut) ||
                                                      (booking.CheckIn > postBooking.CheckIn && booking.CheckOut > postBooking.CheckOut) ||
                                                      (booking.CheckIn < postBooking.CheckIn && booking.CheckOut > postBooking.CheckOut))));
            if (isAddingPossible == true)
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

        public async Task<int> UpdateBookingAsync(PatchBookingDTO patchBooking)
        {
            var result = await _context.Bookings.Where(booking => booking.Id == patchBooking.Id).FirstOrDefaultAsync();
            if (result == null)
            {
                return -2;
            }
            int roomNumber = result.RoomNumber;
            var isUpdatePossible = await _context.Bookings.AnyAsync(booking => !(booking.RoomNumber == roomNumber && booking.Id != patchBooking.Id && 
                                                     ((booking.CheckIn > patchBooking.CheckIn && booking.CheckOut < patchBooking.CheckOut) ||
                                                      (booking.CheckIn < patchBooking.CheckIn && booking.CheckOut < patchBooking.CheckOut) ||
                                                      (booking.CheckIn > patchBooking.CheckIn && booking.CheckOut > patchBooking.CheckOut) ||
                                                      (booking.CheckIn < patchBooking.CheckIn && booking.CheckOut > patchBooking.CheckOut))));
            if(isUpdatePossible == false)
            {
                return -1;
            }
            result.CheckIn = patchBooking.CheckIn;
            result.CheckOut = patchBooking.CheckOut;
            await _context.SaveChangesAsync();
            return 0;
            

        }

        public async Task<IEnumerable<int>> SearchAvailableRoomsAsync(RoomSearchDTO roomSearchDTO, List<RoomDescriptionDTO> rooms)
        {
            List<int> availableRoomsNumber = new List<int>();
            foreach(var room in rooms)
            {
                if(room.PersonsNumber != roomSearchDTO.PersonsNumber)
                {
                    continue;
                }
                var isAvailable = await _context.Bookings.AnyAsync(booking => !(booking.RoomNumber == room.RoomNumber &&
                                                     ((booking.CheckIn > roomSearchDTO.CheckIn && booking.CheckOut < roomSearchDTO.CheckOut) ||
                                                      (booking.CheckIn < roomSearchDTO.CheckIn && booking.CheckOut < roomSearchDTO.CheckOut) ||
                                                      (booking.CheckIn > roomSearchDTO.CheckIn && booking.CheckOut > roomSearchDTO.CheckOut) ||
                                                      (booking.CheckIn < roomSearchDTO.CheckIn && booking.CheckOut > roomSearchDTO.CheckOut))));
                if(isAvailable == false)
                {
                    continue;
                }
                availableRoomsNumber.Add(room.RoomNumber);
            }
            return availableRoomsNumber;
        }
        

    }
}
