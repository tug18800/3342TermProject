using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    public class Department
    {
        private int departID;
        private string departName;
        private string deprtImage;

        public Department() { }

        public int DepartID { get => departID; set => departID = value; }
        public string DepartName { get => departName; set => departName = value; }
        public string DeprtImage { get => deprtImage; set => deprtImage = value; }
    }
}
