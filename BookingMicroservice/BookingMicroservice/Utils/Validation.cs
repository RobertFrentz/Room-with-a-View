using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookingMicroservice.Utils
{
    public static class Validation
    {
        public static bool CheckValidDates(DateTime checkIn, DateTime checkOut)
        {
            if ((checkOut - checkIn).Days < 1)
            {
                return false;
            }
            if (checkOut < DateTime.Now)
            {
                return false;
            }
            return true;
        }
    }
}
