﻿using System;
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
            comm.CommandText = "TP_GetUser";
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
                user.Username = (string)row["LoginId"];
                user.Name = (string)row["Name"];
                user.Phone = (string)row["Phone"];
                user.Email = (string)row["Email"];
                user.Address = (string)row["Address"];
                user.City = (string)row["City"];
                user.State = (string)row["State"];
                user.ZipCode = (int)row["ZipCode"];

                error = "";
                return user;
            }
            catch (Exception ex)
            {
                error = "An error occured while connecting to the database. || Error: " + ex.GetBaseException();
                return null;
            }
           
        }

        public static DataSet GetFirstQuestionSet()
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_GetFirstQuestionSet";
            try
            {
                int n = 0;
                DataSet ds = db.GetDataSetUsingCmdObj(comm, out n);

                if(ds !=null & n >0)
                {
                    return ds;
                }
                else
                {
                    return null;
                }
            }
            catch(Exception ex)
            {
                return null;
            }

        }

        public static DataSet GetSecondQuestionSet()
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_GetSecondQuestionSet";
            try
            {
                int n = 0;
                DataSet ds = db.GetDataSetUsingCmdObj(comm, out n);

                if (ds != null & n > 0)
                {
                    return ds;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public static DataSet GetThirdQuestionSet()
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_GetThirdQuestionSet";
            try
            {
                int n = 0;
                DataSet ds = db.GetDataSetUsingCmdObj(comm, out n);

                if (ds != null & n > 0)
                {
                    return ds;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public static bool SaveUser(User user, out string error)
        {
            DBConnect DB = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_SaveUser";

            comm.Parameters.AddWithValue("@username", user.Username);
            comm.Parameters.AddWithValue("@password", user.Password);
            comm.Parameters.AddWithValue("@name", user.Name);
            comm.Parameters.AddWithValue("@email", user.Email);
            comm.Parameters.AddWithValue("@address", user.Address);
            comm.Parameters.AddWithValue("@city", user.City);
            comm.Parameters.AddWithValue("@state", user.State);
            comm.Parameters.AddWithValue("@zipCode", user.ZipCode);
            comm.Parameters.AddWithValue("@phone", user.Phone);
            comm.Parameters.AddWithValue("@bAddress", user.Billing.Address);
            comm.Parameters.AddWithValue("@bCity", user.Billing.City);
            comm.Parameters.AddWithValue("@bState", user.Billing.State);
            comm.Parameters.AddWithValue("@bZipCode", user.Billing.ZipCode);
            comm.Parameters.AddWithValue("@bPhone", user.Billing.Phone);
            comm.Parameters.AddWithValue("@question1", user.Questions.QuestionOne);
            comm.Parameters.AddWithValue("@question1Answer", user.Questions.QuestionOneAnswer);
            comm.Parameters.AddWithValue("@question2", user.Questions.QuestionTwo);
            comm.Parameters.AddWithValue("@question2Answer", user.Questions.QuestionTwoAnswer);
            comm.Parameters.AddWithValue("@question3", user.Questions.QuestionThree);
            comm.Parameters.AddWithValue("@question3Answer", user.Questions.QuestionThreeAnswer);

            error = "";
            try
            {
                
                int n = DB.DoUpdateUsingCmdObj(comm);

                if (n > 0)
                {
                    error = ""; 
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                error = "An error has occured || Error: " + ex.ToString();
                return false;
            }
        }


    }
}
