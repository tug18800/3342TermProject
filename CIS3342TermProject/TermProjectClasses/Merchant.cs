using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TermProjectClass;

namespace TermProjectClasses
{
    public class Merchant : ContactInformation
    {

        string[] KeyBinding = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

        private string merchantID;
        private string apiKey;

        public Merchant() { }

        public string MerchantID
        {
            get
            {
                if (merchantID == null)
                {
                    merchantID = GetRandomKey();
                    return merchantID;
                }
                else
                    return merchantID;
            }

            set => merchantID = value;

        }


        public string APIKey
        {
            get
            {
                if (apiKey == null)
                {
                    apiKey = GetRandomKey();
                    return apiKey;
                }
                else
                    return apiKey;
            }

            set => apiKey = value;


        }

        private string GetRandomKey()
        {
            //Used to slow down Random's seed generation so a different integer can be produced every iteration.
            Random r = new Random(Guid.NewGuid().GetHashCode());
            string s = "";
            for (int i = 0; i < 8; i++)
            {

                s += KeyBinding[r.Next(0, KeyBinding.Length)];
            }

            return s;
        }
    }
}
