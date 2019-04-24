using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace ValidationClass
{
    public static class Validation
    {
        public static bool IsEmpty(string str)
        {
            if (str == "")
            {
                return true;
            }

            return false;
        }

        public static bool HasLetters(string str)
        {
            Regex regex = new Regex("^[/.a-z]+$");
            string value = str.ToLower();
            if (regex.IsMatch(value))
            {
                return true;
            }

            return false;
        }

        public static bool HasNumbers(string str)
        {
            Regex regex = new Regex("[0-9]");
            if (regex.IsMatch(str))
            {
                return true;
            }

            return false;
        }

        public static bool HasComma(string str)
        {
            Regex regexComma = new Regex("[,]");

            if (regexComma.IsMatch(str))
            {
                return true;
            }

            return false;
        }

        public static bool HasSQL(string str)
        {
            Regex select = new Regex("^[SELECTselect]+$");
            Regex delete = new Regex("^[DELETEDelete]+$");
            Regex drop = new Regex("^[DROPdrop]+$");
            Regex insert = new Regex("^[INSERTinsert]+$");

            List<Regex> sql = new List<Regex>();
            sql.Add(select);
            sql.Add(delete);
            sql.Add(drop);
            sql.Add(insert);

            for (int i = 0; i < sql.Count; i++)
            {
                if (sql[i].IsMatch(str))
                {
                    return true;
                }

            }

            return false;
        }

        public static bool ValidateName(string str)
        {

            if ((str != "") && !(str.Contains("\\d")))
            {
                return true;
            }

            return false;
        }

        public static bool ValidatePhone(string str)
        {
            if (str != "" && !(str.Contains("\\^[0-9]+$")))
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
    }
}
