using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Utils
{
    public static class Cryptography
    {
        static readonly byte[] salt = { 0x91, 0x61, 0x7a, 0xcc, 0x98, 0xa3, 0x87, 0x40, 0x09, 0x6d, 0x51, 0xb0, 0xdb, 0x3b, 0x4e, 0x21 };
        public  static User HashUserData(User user)
        {
            User userHashed = new User(user.Username, HashString(user.Email), HashString(user.Password),0);
            return userHashed;
        }

        public static string HashString(string plaintext)
        {
            if(plaintext == null)
            {
                return null;
            }
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
           password: plaintext,
           salt: salt,
           prf: KeyDerivationPrf.HMACSHA1,
           iterationCount: 10000,
           numBytesRequested: 256 / 8));
            return hashed;
        }
    }
}
