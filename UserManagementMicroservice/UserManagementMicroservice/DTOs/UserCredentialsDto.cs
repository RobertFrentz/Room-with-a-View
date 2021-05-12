
using System.ComponentModel.DataAnnotations;

namespace UserManagementMicroservice.DTOs
{
    public class UserCredentialsDto
    {
        [RegularExpression(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", ErrorMessage = "Invalid email format.")]
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
