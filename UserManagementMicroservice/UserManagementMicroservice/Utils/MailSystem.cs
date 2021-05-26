using System.Net;
using System.Net.Mail;

namespace UserManagementMicroservice.Utils
{
    public static class MailSystem
    {
        public static string email = "royalresidenceiasi@gmail.com";
        public static string password = "royalresidence";
        public static void SendRegistrationMail(string userMail, string username)
        {
            string body = $"Hello {username},\nThank you for registering on our website! Feel free to contact us if you want more information regarding our services. \n\nHave a great day!";
            MailMessage mail = new MailMessage(email, userMail);
            mail.Subject = "Registration";
            mail.Body = body;
            using (var smtpClient = new SmtpClient())
            {
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(email, password);
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.Send(mail);
            }
        }
    }
}
