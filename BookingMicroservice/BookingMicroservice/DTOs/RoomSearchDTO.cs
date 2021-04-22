using System;

namespace BookingMicroservice.DTOs
{
    public class RoomSearchDto
    {
        public string? RoomCategory { get; set; }

        public DateTime? CheckIn { get; set; }
        public DateTime? CheckOut { get; set; }

        public int PersonsNumber { get; set; }
    }
}
