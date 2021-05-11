using BookingMicroservice.DTOs;
using BookingMicroservice.Entities;
using System;
using System.Collections.Generic;
using System.Diagnostics.SymbolStore;
using System.Threading.Tasks;

namespace BookingMicroservice.Data
{
    public interface IBookingsRepository
    {

        Task<IEnumerable<Booking>> GetBookings();
        Task<IEnumerable<Booking>> GetBookingsByUserId(int userId);
        Task<GetBookingDto?> GetBookingByIdAsync(int id);
        Task<int> AddBookingAsync(PostBookingDto postBooking);
        Task<int> UpdateBookingAsync(PatchBookingDto patchBooking);
        Task<IEnumerable<RoomDescriptionDto>> SearchAvailableRoomsAsync(RoomSearchDto roomSearchDTO, List<RoomDescriptionDto> rooms);

        Task<bool> CheckRoomAvailability(int roomNumber, DateTime? checkIn, DateTime? checkOut);
    }
}
