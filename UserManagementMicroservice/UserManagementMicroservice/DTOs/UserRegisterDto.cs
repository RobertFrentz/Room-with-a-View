using System.ComponentModel.DataAnnotations;

namespace UserManagementMicroservice.DTOs
{
    public class UserRegisterDto
    {
        public string Username { get; set; }
        [RegularExpression(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", ErrorMessage = "Invalid email format.")]
        public string Email { get; set; }
        public string Password { get; set; }

    }
}
