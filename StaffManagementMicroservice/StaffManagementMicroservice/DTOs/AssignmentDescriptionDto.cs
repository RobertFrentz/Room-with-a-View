using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.DTOs
{
    public class AssignmentDescriptionDto
    {
        public int UserId { get; set; }
        public string Type { get; set; }
        public string Observations { get; set; }
        public DateTime AddedAt { get; set; }
        public int Status { get; set; }
    }
}
