using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Entities
{
    public class Assignment
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Type { get; set; }
        public string Observations { get; set; }
        public DateTime AddedAt { get; set; }
        public int Status { get; set; }
    }
}
