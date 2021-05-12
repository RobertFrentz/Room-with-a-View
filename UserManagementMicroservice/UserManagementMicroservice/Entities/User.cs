using System.ComponentModel.DataAnnotations;

namespace UserManagementMicroservice.Entities
{
    public class User
    {
        public User()
        {

        }
        public User(string username, string email, string password,int role)
        {
            Username = username;
            Email = email;
            Password = password;
            Role = role;
        }

        public User(int Id, string username, string email, string password)
        {
            this.Id = Id;
            Username = username;
            Email = email;
            Password = password;
        }

        public int Id { get; set; }
        public string Username { get; set; }
        [RegularExpression(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", ErrorMessage = "Invalid email format.")]
        public string Email { get; set; }
        public string Password { get; set; }

        public int Role { get; set; }
    }
}
