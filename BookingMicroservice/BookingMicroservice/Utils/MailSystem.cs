using System;
using System.Net;
using System.Net.Mail;

namespace BookingMicroservice.Utils
{
    public static class MailSystem
    {
        private static readonly string email = "royalresidenceiasi@gmail.com";
        private static readonly string password = "royalresidence";

        public static void SendAddedBookingMail(string userMail, string username, int roomNumber, DateTime checkIn, DateTime checkOut)
        {
            string dateTime1 = checkIn.ToString("yyyy-MM-dd");
            string dateTime2 = checkOut.ToString("yyyy-MM-dd");
            string body = $"Hello {username},\nThank you for booking room {roomNumber} on our website during {dateTime1} - {dateTime2}.\nFeel free to contact us if you want more information regarding our services. \n\nHave a great day!";
            MailMessage mail = new MailMessage(email, userMail);
            mail.Subject = "Booking registered";
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

        public static void SendUpdatedBookingMail(string userMail, string username, int bookingId, DateTime checkIn, DateTime checkOut)
        {
            string dateTime1 = checkIn.ToString("yyyy-MM-dd");
            string dateTime2 = checkOut.ToString("yyyy-MM-dd");
            string body = $"Hello {username},\nYour booking with id {bookingId} was updated with new dates: {dateTime1} - {dateTime2}.\nFeel free to contact us if you want more information regarding our services. \n\nHave a great day!";
            MailMessage mail = new MailMessage(email, userMail);
            mail.Subject = "Booking updated";
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