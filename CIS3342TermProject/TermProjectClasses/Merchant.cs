using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    public class Merchant
    {
        private int merchantID;
        private string phone;
        private string address;
        private string city;
        private string state;
        private string zip;

        public Merchant() { }


        public int MerchantID { get => merchantID; set => merchantID = value; }

        public string Phone { get => phone; set => phone = value; }

        public string Address { get => address; set => address = value; }

        public string City { get => city; set => city = value; }

        public string State { get => state; set => state = value; }

        public string ZIP { get => zip; set => zip = value; }

    }
}
