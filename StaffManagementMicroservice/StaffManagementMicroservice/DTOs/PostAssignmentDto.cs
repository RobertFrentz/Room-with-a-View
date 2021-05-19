using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.DTOs
{
    public class PostAssignmentDto
    {
        public int userId { get; set; }
        public int RoomNumber { get; set; }
        public string Type { get; set; }
        public string Observations { get; set; }
    }
}
