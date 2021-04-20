using BookingMicroservice.DTOs;
using BookingMicroservice.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BookingMicroservice.Data
{
    public interface IBookingsRepository
    {

        Task<IEnumerable<Booking>> GetBookings();
        Task<GetBookingDTO> GetBookingByIdAsync(int id);
        Task<int> AddBookingAsync(PostBookingDTO postBooking);
        Task<int> UpdateBookingAsync(PatchBookingDTO patchBooking);
        Task<IEnumerable<int>> SearchAvailableRoomsAsync(RoomSearchDTO roomSearchDTO, List<RoomDescriptionDTO> rooms);
    }
}
