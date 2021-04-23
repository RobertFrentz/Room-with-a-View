using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.DTOs
{
    public class PatchRoomDto
    {
        //public int RoomNumber { get; set; }
        public int PersonsNumber { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public string Facilities { get; set; }
        public string State { get; set; }
    }
}
