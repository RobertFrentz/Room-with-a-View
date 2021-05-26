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

        Task<IEnumerable<Booking>> GetBookingsAsync();
        Task<IEnumerable<Booking>> GetBookingsByUserIdAsync(int userId);
        Task<GetBookingDto?> GetBookingByIdAsync(int id);
        Task<int> AddBookingAsync(PostBookingDto postBooking, int userId, int price);
        Task<int> UpdateBookingAsync(PatchBookingDto patchBooking, int userId);
        Task<IEnumerable<RoomDescriptionDto>> SearchAvailableRoomsAsync(RoomSearchDto roomSearchDTO, List<RoomDescriptionDto> rooms);

        Task<bool> CheckRoomAvailabilityAsync(int roomNumber, DateTime? checkIn, DateTime? checkOut);

        Task<List<object>?> GetCheckInCheckOutForSpecificRoom(int roomNumber);
    }
}
