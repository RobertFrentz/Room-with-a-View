using System;

namespace StaffManagementMicroservice.Entities
{
    public class Assignment
    {
        public int Id { get; set; }
        public int RoomNumber { get; set; }
        public int UserId { get; set; }
        public string Type { get; set; }
        public string Observations { get; set; }
        public DateTime AddedAt { get; set; }
        public int Status { get; set; }
    }
}
