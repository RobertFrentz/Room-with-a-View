using JWT;
using JWT.Algorithms;
using JWT.Builder;
using JWT.Exceptions;
using JWT.Serializers;
using System;
using System.Linq;

namespace UserManagementMicroservice.Utils
{
    public static class Jwt
    {
        public static string CreateJWT(int userId, int time)
        {
            var token = new JwtBuilder()
                           .WithAlgorithm(new HMACSHA256Algorithm())
                           .WithSecret("GQDstcKsx0NHjPOuXOYg5MbeJ1XT0uFiwDVvVBrk")
                           .AddClaim("exp", DateTimeOffset.UtcNow.AddHours(time).ToUnixTimeSeconds())
                           .AddClaim("userId", userId)
                           .Encode();
            return token;
        }

        public static string CheckJWT(string jwt)
        {
            string json;
            try
            {
                IJsonSerializer serializer = new JsonNetSerializer();
                var provider = new UtcDateTimeProvider();
                IJwtValidator validator = new JwtValidator(serializer, provider);
                IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
                IJwtAlgorithm algorithm = new HMACSHA256Algorithm(); // symmetric
                IJwtDecoder decoder = new JwtDecoder(serializer, validator, urlEncoder, algorithm);
                json = decoder.Decode(jwt, "GQDstcKsx0NHjPOuXOYg5MbeJ1XT0uFiwDVvVBrk", verify: true);
            }
            catch (TokenExpiredException)
            {
                return "Token has expired";
            }
            catch (SignatureVerificationException)
            {
                return "Token has invalid signature";
            }
            return json;
        }

        public static bool IsValidJWT(string jwt)
        {
            if(jwt == "Token has expired" || jwt == "Token has invalid signature")
            {
                return false;
            }
            return true;
        }

        public static int ExtractUserId(string jwt)
        {
            string claims = jwt.Split(',').ToList()[1].Split(':').ToList()[1];
            string id = claims.Remove(claims.Length - 1);
            return Int32.Parse(id);
        }
    }
}
