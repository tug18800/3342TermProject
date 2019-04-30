using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    public class Dept
    {

        private string departmentNumber;
        private string departmentName;
        private string departmentImage;

        public Dept() { }

        public string DepartmentNumber { get => departmentNumber; set => departmentNumber = value; }
        public string DepartmentName { get => departmentName; set => departmentName = value; }
        public string DepartmentImage { get => departmentImage; set => departmentImage = value; }
    }
}
