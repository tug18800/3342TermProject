using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    [Serializable]
    public class Department
    {
        private string deptID;
        private string deptName;
        private string deptImage;

        public Department() { }

        public string departmentNumber { get => deptID; set => deptID = value; }
        public string departmentName { get => deptName; set => deptName = value; }
        public string departmentImage { get => deptImage; set => deptImage = value; }
    }
}
