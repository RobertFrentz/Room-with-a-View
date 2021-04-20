

using System;

namespace BookingMicroservice.DTOs
{

    public class GetBookingDTO
    {
        public GetBookingDTO()
        {

        }

        public GetBookingDTO(int id, int roomNumber, DateTime checkIn, DateTime checkOut, int totalPay, string status)
        {
            Id = id;
            RoomNumber = roomNumber;
            CheckIn = checkIn;
            CheckOut = checkOut;
            TotalPay = totalPay;
            Status = status;
        }

        public int Id { get; set; }
        public int RoomNumber { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int TotalPay { get; set; }
        public string Status { get; set; }
    }
}
