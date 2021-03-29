using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UserManagementMicroservice.Utils
{
    public class Error
    {
        public Error(string _error_info)
        {
            error_info = _error_info;
        }
        public string error_info { get; set; }
    }
}
