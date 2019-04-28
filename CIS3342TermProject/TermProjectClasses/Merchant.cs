using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace TermProjectClasses
{
    public class Merchant : User
    {

        string[] KeyBinding = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

        private string apiKey;
        private string apiUrl;
        private string siteID;
        private string description;
        private List<Department> departments;
        private List<Product> products;


        public Merchant() { }

        public string APIKey
        {
            get => apiKey;
            set => apiKey = value;
        }
        public string ApiUrl { get => apiUrl; set => apiUrl = value; }
        public string SiteID { get => siteID; set => siteID = value; }
        public string Description { get => description; set => description = value; }
        public List<Department> Departments { get => departments; set => departments = value; }
        public List<Product> Products { get => products; set => products = value; }
        public string GetRandomKey()
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
