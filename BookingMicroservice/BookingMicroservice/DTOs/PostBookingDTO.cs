using System;

namespace BookingMicroservice.DTOs
{
    public class PostBookingDto
    {
        public int RoomNumber { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
    }
}
