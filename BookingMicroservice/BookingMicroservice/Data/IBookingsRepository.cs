using BookingMicroservice.DTOs;
using BookingMicroservice.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BookingMicroservice.Data
{
    public interface IBookingsRepository
    {

        Task<IEnumerable<Booking>> GetBookings();
        Task<IEnumerable<Booking>> GetBookingsByUserId(int userId);
        Task<GetBookingDTO> GetBookingByIdAsync(int id);
        Task<int> AddBookingAsync(PostBookingDTO postBooking);
        Task<int> UpdateBookingAsync(PatchBookingDTO patchBooking);
        Task<IEnumerable<RoomDescriptionDTO>> SearchAvailableRoomsAsync(RoomSearchDTO roomSearchDTO, List<RoomDescriptionDTO> rooms);
    }
}
