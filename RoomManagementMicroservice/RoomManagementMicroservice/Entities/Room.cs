﻿using RoomManagementMicroservice.Utils;
using System;

namespace RoomManagementMicroservice.Entities
{
    public class Room
    { 
        public int Id { get; set; }

        public string RoomCategory { get; set; }

        public DateTime? CheckIn { get; set; }
        public DateTime? CheckOut { get; set; }

        public int PersonsNumber { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public string Facilities { get; set; }
        public string State { get; set; }

    }
}
