using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security; // needed for HashPasswordForStoringInConfigFile
using System.Security.Cryptography; // needed for RNGCryptoServiceProvider


namespace SiteSecurity
{
    // Class for hashing a password
    public class SecurePassword
    {
        // Combines a salt and a password before hashing using the SHA1 algorithm
        // Returns a 40 character hash string
        public static string HashPassword(string salt, string password)
        {
            string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(salt + password, "SHA1");
            return hash;
        }

        // Creates Random Salt that is the same length as the generated hash
        public static string CreateSalt()
        {
            //Generate a salt using a cryptographic random number   
            RNGCryptoServiceProvider rand = new RNGCryptoServiceProvider();
            byte[] salt = new byte[30];
            rand.GetBytes(salt);
            // Return a Base64 string representation of the random number    
            return Convert.ToBase64String(salt);
        }
    }
}
