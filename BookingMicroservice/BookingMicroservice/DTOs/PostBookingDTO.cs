using System;

namespace BookingMicroservice.DTOs
{
    public class PostBookingDTO
    {
        public int RoomNumber { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int UserId { get; set; }
    }
}
