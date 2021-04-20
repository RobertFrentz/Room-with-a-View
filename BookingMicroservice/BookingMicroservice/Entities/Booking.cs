using System;

namespace BookingMicroservice.Entities
{
    public class Booking
    {
        public int Id { get; set; }
        public int RoomNumber { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }   
        public int UserId { get; set; }
        public int TotalPay { get; set; }
        public string Status { get; set; }

    }
}
