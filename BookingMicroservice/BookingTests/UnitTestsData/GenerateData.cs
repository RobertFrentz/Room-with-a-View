using BookingMicroservice.Repositories;
using BookingMicroservice.Entities;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BookingMicroservice.Utils
{
    public class GenerateData
    {
        private readonly DataContext context;

        public GenerateData(DataContext _context)
        {
            context = _context;
        }
        public string SeedDataAndGetToken(string valid)
        {
            DataForUnitTests dataList = new DataForUnitTests();
            List<Booking> FakeBookings = dataList.ReturnList();
            
            for (int i = 0; i < FakeBookings.Count; i++)
            {
                context.Add(FakeBookings[i]);
                context.SaveChanges();
                context.Entry<Booking>(FakeBookings[i]).State = EntityState.Detached;
            }
            if (valid == "Valid")
            {
                return dataList.JwtValid;
            }
            else
            {
                return dataList.JwtInvalid;
            }
        }
    }
}
