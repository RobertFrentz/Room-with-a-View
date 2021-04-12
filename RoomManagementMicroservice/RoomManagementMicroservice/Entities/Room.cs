using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Entities
{
    public class Room
    {
        public int Id { get; set; }
        
        public int UserId { get; set; }

        public string RoomCategory { get; set; }

        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }

        public int PersonsNumber { get; set; }

        public string State { get; set; }
    }
}
