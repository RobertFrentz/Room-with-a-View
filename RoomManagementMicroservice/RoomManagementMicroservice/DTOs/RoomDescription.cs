using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Utils
{
    public class RoomDescription
    {
        public string RoomCategory { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public string Facilities { get; set; }
    }
}
