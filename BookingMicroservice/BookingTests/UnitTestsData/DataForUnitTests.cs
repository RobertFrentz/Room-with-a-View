using BookingMicroservice.Entities;
using System;
using System.Collections.Generic;

namespace BookingMicroservice.Utils
{
    public class DataForUnitTests
    {
        public List<Booking>? Bookings { get; set; } = new List<Booking>();
        public string JwtValid { get; set; } = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XL0";
        public string JwtInvalid { get; set; } = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NTU2Mjg0MjgsInVzZXJJZCI6MjB9.wNUTeUxrW1N0pmWG3MBHcEzcNI3t5n-SzVoYevQUgE2";
        public List<Booking> ReturnList()
        {
            
            Bookings.AddRange(new Booking[]{new Booking()
            {
                Id = 1, RoomNumber = 200, CheckIn = new DateTime(2021, 04, 28), CheckOut = new DateTime(2021, 04, 30),
                UserId = 15, TotalPay = 100, Status = "Registered"
            },
            new Booking()
            {
                Id = 2, RoomNumber = 201, CheckIn = new DateTime(2021, 05, 01), CheckOut = new DateTime(2021, 05, 03),
                UserId = 15, TotalPay = 120, Status = "Registered"
            },
            new Booking()
            {
                Id = 3, RoomNumber = 202, CheckIn = new DateTime(2021, 05, 05), CheckOut = new DateTime(2021, 05, 10),
                UserId = 15, TotalPay = 200, Status = "Registered"
            },
            new Booking()
            {
                Id = 4, RoomNumber = 203, CheckIn = new DateTime(2021, 05, 11), CheckOut = new DateTime(2021, 05, 13),
                UserId = 10, TotalPay = 150, Status = "Registered"
            },
            new Booking()
            {
                Id = 5, RoomNumber = 204, CheckIn = new DateTime(2021, 05, 15), CheckOut = new DateTime(2021, 05, 21),
                UserId = 10, TotalPay = 300, Status = "Registered"
            } });
            return Bookings;
        }
    }
}
