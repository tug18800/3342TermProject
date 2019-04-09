using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    public class Product
    {
        private int productID;
        private string desc;
        private double price;
        private string url;
        private int departmentID;

        public Product() { }

        public int ProductID { get => productID; set => productID = value; }
        public string Desc { get => desc; set => desc = value; }
        public double Price { get => price; set => price = value; }
        public string Url { get => url; set => url = value; }
        public int DepartmentID { get => departmentID; set => departmentID = value; }
    }
}
