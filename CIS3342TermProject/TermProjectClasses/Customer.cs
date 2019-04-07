using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;

namespace TermProjectClasses
{
    public class Customer
    {
        private int customerID;
        private string firstName;
        private string lastName;
        private int age;
        private string phone;
        private string address;
        private string city;
        private string state;
        private string zip;
        private double totalPurchases;

        public Customer() { }

        public int CustomerID { get => customerID; set => customerID = value; }

        public string FirstName { get => firstName; set => firstName = value; }

        public string LastName { get => lastName; set => lastName = value; }

        public int Age { get => age; set => age = value; }

        public string Phone { get => phone; set => phone = value; }

        public string Address { get => address; set => address = value; }

        public string City { get => city; set => city = value; }

        public string State { get => state; set => state = value; }

        public string ZIP { get => zip; set => zip = value; }

        public double TotalPurchases { get => totalPurchases; set => totalPurchases = value; }

    }
}
