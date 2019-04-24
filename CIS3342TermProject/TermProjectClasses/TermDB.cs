using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Utilities;
namespace TermProjectClasses
{
    public static class TermDB
    {
        public static bool IsUniqueUsername(string username, out string error)
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.CommandText = "TP_GetUsername";
            comm.Parameters.AddWithValue("@username", username);

            try
            {
                int n = 0;
                db.GetDataSetUsingCmdObj(comm, out n);

                if (n > 0)
                {
                    error = "This username already exists!";
                    return false;
                }

                error = "";
                return true;
            }
            catch(Exception ex)
            {
                error = "An error occured while connecting to the database. || Error: " + ex.GetBaseException();
                return false;
            }

           
        }

        public static User GetUser(string username, string password, out string error)
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.CommandText = "GetUser";
            comm.Parameters.AddWithValue("@username", username);
            comm.Parameters.AddWithValue("@password", password);

            try
            {
                int n = 0;
                DataSet ds = db.GetDataSetUsingCmdObj(comm, out n);

                if(ds == null || n <= 0)
                {
                    error = "We do not have an accound with that username and password. Try again.";
                    return null;
                }

                DataRow row = ds.Tables[0].Rows[0];

                User user = new User();
                user.Username = (string)row["Name"];
                user.Name = (string)row["Name"];
                user.Phone = (string)row["Name"];
                user.Email = (string)row["Name"];
                user.Address = (string)row["Name"];
                user.City = (string)row["Address"];
                user.State = (string)row["Name"];
                user.ZipCode = (int)row["Name"];

                error = "";
                return user;
            }
            catch (Exception ex)
            {
                error = "An error occured while connecting to the database. || Error: " + ex.GetBaseException();
                return null;
            }
           
        }
    }
}
