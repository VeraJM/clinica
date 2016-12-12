using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace ClinicaFrba.Utils
{
    class Hasher
    {
        private HashAlgorithm algorithm;

        public Hasher(HashAlgorithm algorithm)
        {
            this.algorithm = algorithm;
        }

        public String hash(String input)
        {
            Byte[] inputBytes = Encoding.UTF8.GetBytes(input);

            Byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            return BitConverter.ToString(hashedBytes).Replace("-", "");
        }
    }
}
