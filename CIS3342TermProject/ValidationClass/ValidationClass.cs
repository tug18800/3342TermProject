using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace ValidationClass
{
    public static class Validation
    {
        public static bool IsEmpty(TextBox txtBox)
        {
            if (txtBox.Text == "")
            {
                return true;
            }

            return false;
        }

        public static bool HasLetters(TextBox txtBox)
        {
            Regex regex = new Regex("^[/.a-z]+$");
            string value = txtBox.Text.ToLower();
            if (regex.IsMatch(value))
            {
                return true;
            }

            return false;
        }

        public static bool HasNumbers(TextBox txtBox)
        {
            Regex regex = new Regex("[0-9]");
            if (regex.IsMatch(txtBox.Text))
            {
                return true;
            }

            return false;
        }

        public static string IsOperation(TextBox txtBox)
        {
            Regex regexGT = new Regex("[>]");
            Regex regexLT = new Regex("[<]");
            Regex regexET = new Regex("[=]");
            Regex regexNET = new Regex("[!=]");

            if (regexGT.IsMatch(txtBox.Text))
            {
                return "GT";
            }
            else if (regexLT.IsMatch(txtBox.Text))
            {
                return "LT";
            }
            else if (regexET.IsMatch(txtBox.Text))
            {
                return "ET";
            }
            else if (regexNET.IsMatch(txtBox.Text))
            {
                return "NET";
            }

            return "false";
        }

        public static bool HasComma(TextBox txtBox)
        {
            Regex regexComma = new Regex("[,]");

            if (regexComma.IsMatch(txtBox.Text))
            {
                return true;
            }

            return false;
        }

        public static bool ValidateName(TextBox txtBox)
        {

            if ((txtBox.Text != "") && !(txtBox.Text.Contains("\\d")))
            {
                return true;
            }

            return false;
        }

        public static bool ValidatePhone(TextBox txtBox)
        {
            if (txtBox.Text != "" && !(txtBox.Text.Contains("\\^[0-9]+$")))
            {
                return true;
            }

            return false;
        }

        public static bool ValidateDDL(DropDownList ddList)
        {
            if (!(ddList.SelectedIndex == -1))
            {
                return true;
            }

            return false;
        }

        public static bool ValidateGridView(GridView gvGrid, string cbID, string txtID)
        {
            foreach (GridViewRow row in gvGrid.Rows)
            {
                if (((CheckBox)row.FindControl(cbID)).Checked)
                {
                    if (((TextBox)row.FindControl(txtID)).Text != "")
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        public static string[] GetFiledFromSearch(string[] search)
        {
            string str = search[0] + " " + search[1];
            str = str.ToLower();
            switch (str)
            {
                case "median income": str = "medianIncome"; break;
                case "owners percent": str = "ownersPercent"; break;
                case "renters percent": str = "rentersPercent"; break;
                case "home value": str = "homeValue"; break;
                case "median age": str = "medianAge"; break;
                case "unemployment percent": str = "unemploymentPercent"; break;
                case "crime index": str = "crimeIndex"; break;
            }

            string[] result = new string[3];

            result[0] = str;
            result[1] = search[2];
            result[2] = search[3];

            return result;
        }


    }
}
