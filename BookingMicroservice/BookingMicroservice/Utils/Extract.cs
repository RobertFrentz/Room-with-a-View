using System;
using System.Linq;

namespace BookingMicroservice.Utils
{
    public static class Extract
    {
        public static int ExtractUserId(string jwt)
        {
            string claims = jwt.Split(',').ToList()[1].Split(':').ToList()[1];
            string id = claims.Remove(claims.Length - 1);
            return Int32.Parse(id);
        }
        
        public static int ExtractPrice(string data)
        {
            int startPos = data.IndexOf("Price\":");
            int i = startPos + 7;
            while(data[i] != ',')
            {
                i++;
            }
            return Int32.Parse(data.Substring(startPos + 7, i - startPos - 7));
        }
    }
}
