
using System;

namespace BookingMicroservice.DTOs
{
    public class PatchBookingDTO
    {
        public int Id { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
    }
}
