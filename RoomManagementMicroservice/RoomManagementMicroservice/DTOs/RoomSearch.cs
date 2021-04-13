﻿using System;

namespace RoomManagementMicroservice.Utils
{
    public class RoomSearch
    {
        public string RoomCategory { get; set; }

        public DateTime? CheckIn { get; set; }
        public DateTime? CheckOut { get; set; }

        public int PersonsNumber { get; set; }
    }
}