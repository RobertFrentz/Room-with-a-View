using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Utils
{
    public static class Extract
    {
            public static int ExtractUserId(string jwt)
            {
                string claims = jwt.Split(',').ToList()[1].Split(':').ToList()[1];
                string id = claims.Remove(claims.Length - 1);
                return Int32.Parse(id);
            }
    }
}
