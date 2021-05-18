using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Utils
{
    public class Error
    {
        public Error(string errorMessage)
        {
            this.ErrorMessage = errorMessage;
        }
        public string ErrorMessage { get; set; }
    }
}
