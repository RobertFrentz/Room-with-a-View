

using System.ComponentModel.DataAnnotations;

namespace UserManagementMicroservice.Entities
{
    public class User
    {

        public User(int Id, string username, string email, string password)
        {
            this.Id = Id;
            Username = username;
            Email = email;
            Password = password;
        }

        public int Id { get; set; }
        public string Username { get; set; }
        [Key]
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
