using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.Extensions.Primitives;
using System;
using System.Security.Cryptography;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Utils
{
    public static class Cryptography
    {
        private static readonly IDataProtectionProvider _dataProtectionProvider = DataProtectionProvider.Create("RoomView");
        private static readonly byte[] salt = { 0x91, 0x61, 0x7a, 0xcc, 0x98, 0xa3, 0x87, 0x40, 0x09, 0x6d, 0x51, 0xb0, 0xdb, 0x3b, 0x4e, 0x21 };
        private const string Key = "GigelSiMirelAuFostLaPescuit";
        public static User SecureUserData(User user)
        {
            User userHashed = new(user.Username, Encrypt(user.Email), HashString(user.Password), user.Role);
            return userHashed;
        }

        public static string HashString(string plaintext)
        {
            if (plaintext == null)
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
        public static string Encrypt(string input)
        {
            var protector = _dataProtectionProvider.CreateProtector(Key);
            return protector.Protect(input);
        }

        public static string Decrypt(string cipherText)
        {
            var protector = _dataProtectionProvider.CreateProtector(Key);
            string plaintext = null;
            try
            {
                plaintext = protector.Unprotect(cipherText);
            }
            catch (CryptographicException e)
            {
                Console.WriteLine(e);
            }
            return plaintext;
        }
    }
}
