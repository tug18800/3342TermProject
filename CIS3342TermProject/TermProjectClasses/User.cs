using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TermProjectClass;

namespace TermProjectClasses
{
    public class User : ContactInformation
    {

        private string username;
        private string password;
        private Questions questions;
        private ContactInformation billing;

        public User() { }

        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
        public Questions Questions { get => questions; set => questions = value; }
        public ContactInformation Billing { get => billing; set => billing = value; }
    }
}
