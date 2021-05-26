using System;

namespace BookingMicroservice.DTOs
{
    public class PostBookingDto : DateInterval
    {
        public int RoomNumber { get; set; }

        public string SessionId  { get; set; }
    }
}
