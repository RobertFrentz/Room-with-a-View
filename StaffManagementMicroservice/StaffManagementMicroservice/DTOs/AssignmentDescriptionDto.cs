using System;

namespace StaffManagementMicroservice.DTOs
{
    public class AssignmentDescriptionDto
    {
        public int UserId { get; set; }
        public int RoomNumber { get; set; }
        public string Type { get; set; }
        public string Observations { get; set; }
        public DateTime AddedAt { get; set; }
        public int Status { get; set; }
    }
}
