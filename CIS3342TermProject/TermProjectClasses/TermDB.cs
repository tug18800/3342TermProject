using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
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
            catch (Exception ex)
            {
                error = "An error occured while connecting to the database. || Error: " + ex.GetBaseException();
                return false;
            }
        }

        public static bool IsUniqueMerchant(string merchantID, out string error)
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.CommandText = "TP_GetMerchant";
            comm.Parameters.AddWithValue("@merchantID", merchantID);

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
            catch (Exception ex)
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

                if (ds == null || n <= 0)
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

        public static bool SaveUserInfo(User user)
        {
            DBConnect DB = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_SaveUserInfo";

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

            
            try
            {

                int n = DB.DoUpdateUsingCmdObj(comm);

                if (n > 0)
                {

                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                
                return false;
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
            catch (Exception ex)
            {
                error = "An error has occured || Error: " + ex.ToString();
                return false;
            }
        }

        public static bool SaveMerchant(Merchant merchant, out string error)
        {
            ContactInformation contact = new ContactInformation();
            contact.Name = merchant.Name;
            contact.Address = merchant.Address;
            contact.City = merchant.City;
            contact.State = merchant.State;
            contact.ZipCode = merchant.ZipCode;
            contact.Email = merchant.Email;
            contact.Phone = merchant.Phone;

            if (!merchant.ApiUrl.EndsWith("/"))
                merchant.ApiUrl += "/";

            string url = merchant.ApiUrl + "RegisterSite/" + merchant.SiteID + "/" + merchant.Description + "/" + merchant.APIKey;
            string result = WebCom.PushPOST(url, contact);

            if (result == "false" || result == "An error has occured retrieving data from the Web API.")
            {
                error = "Sorry, we could not finish the transaction! Please check your Api Url and try again!";
                return false;
            }
            DBConnect DB = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_SaveMerchant";

            comm.Parameters.AddWithValue("@username", merchant.Username);
            comm.Parameters.AddWithValue("@password", merchant.Password);
            comm.Parameters.AddWithValue("@apiKey", merchant.APIKey);
            comm.Parameters.AddWithValue("@apiUrl", merchant.ApiUrl);
            comm.Parameters.AddWithValue("@siteID", merchant.SiteID);
            comm.Parameters.AddWithValue("@description", merchant.Description);
            comm.Parameters.AddWithValue("@name", merchant.Name);
            comm.Parameters.AddWithValue("@phone", merchant.Phone);
            comm.Parameters.AddWithValue("@email", merchant.Email);
            comm.Parameters.AddWithValue("@address", merchant.Address);
            comm.Parameters.AddWithValue("@city", merchant.City);
            comm.Parameters.AddWithValue("@state", merchant.State);
            comm.Parameters.AddWithValue("@zipCode", merchant.ZipCode);

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
                    error = "Something went wrong!";
                    return false;
                }
            }
            catch (Exception ex)
            {
                error = "An error has occured || Error: " + ex.ToString();
                return false;
            }
        }

        public static List<Merchant> GetMerchants()
        {
            List<Merchant> list = new List<Merchant>();

            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_GetMerchantList";

            try
            {
                int n = 0;
                DataSet ds = db.GetDataSetUsingCmdObj(comm, out n);

                if (n < 0)
                {
                    return null;
                }

                DataRowCollection rows = ds.Tables[0].Rows;

                for (int i = 0; i < rows.Count; i++)
                {
                    Merchant m = new Merchant();

                    m.Username = (string)rows[i]["MerchantID"];
                    m.SiteID = (string)rows[i]["SiteID"];
                    m.APIKey = (string)rows[i]["APIKey"];
                    m.ApiUrl = (string)rows[i]["APIUrl"];

                    list.Add(m);
                }

                return list;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public static bool GetDepartment(string apiUrl, out List<Department> result)
        {
            try
            {
                result = new List<Department>();
                string json = WebCom.GetJson(apiUrl + "/GetDepartments");
                string[] j = json.Split('\"');
                List<Department> dep = new JavaScriptSerializer().Deserialize<List<Department>>(json);

                if(dep[0].DeptID == null)
                {
                    List<Dept> derp = new JavaScriptSerializer().Deserialize<List<Dept>>(json);
                    foreach (Dept d in derp)
                    {
                        Department dept = new Department();
                        dept.DeptID = d.DepartmentNumber;
                        dept.DeptName = d.DepartmentName;
                        dept.DeptImage = d.DepartmentImage;

                        result.Add(dept);
                    }

                    return true;
                }
                if (dep != null)
                {
                    result = dep;
                    return true;
                }
                else
                {
                    result = null;
                    return false;
                }
            }
            catch (Exception ex)
            {
                result = null;
                return false;
            }

        }

        public static bool GetOther(string apiUrl, out List<Department> result)
        {

            try
            {
                string json = WebCom.GetJson(apiUrl + "/GetDepartments");

                List<Dept> dep = new JavaScriptSerializer().Deserialize<List<Dept>>(json);

                result = new List<Department>();
                foreach (Dept d in dep)
                {
                    Department dept = new Department();
                    dept.DeptID = d.DepartmentNumber;
                    dept.DeptName = d.DepartmentName;
                    dept.DeptImage = d.DepartmentImage;

                    result.Add(dept);
                }

                if (dep != null)
                {
                    return true;
                }
                else
                {
                    result = null;
                    return false;
                }
            }
            catch (Exception ex)
            {
                result = null;
                return false;
            }
        }

        public static List<Product> GetProductCatalogue(string apiUrl, string deptNum)
        {
            try
            {
                string json = WebCom.GetJson(apiUrl + "/GetProductCatalog/" + deptNum);
                List<Product> dep = new JavaScriptSerializer().Deserialize<List<Product>>(json);

                if (dep != null)
                    return dep;
                else
                    return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public static bool RecordOrder(Order order, string username, out string error)
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_RecordOrder";

            comm.Parameters.AddWithValue("@totalPrice", order.GetTotalPrice());
            comm.Parameters.AddWithValue("@loginId", username);

            
            try
            {
                int n = db.DoUpdateUsingCmdObj(comm);

                if(n < 0)
                {
                    error = "An error occured connecting to the database.";
                    return false;
                }

                

                foreach(OrderLine item in order.Items)
                {
                    comm = new SqlCommand();
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "TP_RecordOrderLine";
                    comm.Parameters.AddWithValue("@productID", item.Item.ProductID);
                    comm.Parameters.AddWithValue("@quantity", item.Quantity);
                    comm.Parameters.AddWithValue("@price",item.Item.Price);
                    comm.Parameters.AddWithValue("@deptId", item.Item.DepartmentID);
                    comm.Parameters.AddWithValue("@username", item.MerchantId);

                    n = db.DoUpdateUsingCmdObj(comm);

                    if (n < 0)
                    {
                        error = "An error occured connecting to the database.";
                        return false;
                    }

                }

                error = "";
                return true;
            }
            catch(Exception ex)
            {
                error = "The oepration failed. || Error: " + ex.InnerException;
                return false;
            }

        }

        public static bool PostOrder(Order order, Merchant merchant, User user, out string error)
        {
            Customer cust = new Customer();

            cust.CustomerID = user.Username;
            cust.Name = user.Name;
            cust.Address = user.Address;
            cust.City = user.City;
            cust.State = user.State;
            cust.ZipCode = user.ZipCode;
            cust.Phone = user.Phone;
            cust.Email = user.Email;

            foreach(OrderLine item in order.Items)
            {
                string x = "";
                x += "/" + item.Item.ProductID;
                x += "/" + item.Quantity + "/";
                x += "/" + merchant.SiteID + "/";
                x += "/" + merchant.APIKey;


                string result = WebCom.PushPOST(merchant.ApiUrl + "RecordPurchase" + x, cust);

                if(result == "false")
                {
                    error = "The operation was not successful.";
                    return false;
                }
            }

            error = "";
            return true;
        }

        public static bool SaveCart(byte[] cart, string username)
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_SaveCart";

            comm.Parameters.AddWithValue("@cart", cart);
            comm.Parameters.AddWithValue("@username", username);

            try
            {
                int n = db.DoUpdateUsingCmdObj(comm);
                
                if( n < 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch(Exception ex)
            {
                return false;
            }

        }

        public static bool CheckCart(string username)
        {
            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_CheckCart";

            comm.Parameters.AddWithValue("@username", username);

            try
            {
                int n;
                db.GetDataSetUsingCmdObj(comm, out n);



                if (n <= 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public static Order GetCart(string username)
        {

            DBConnect db = new DBConnect();
            SqlCommand comm = new SqlCommand();

            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "TP_GetCart";

            comm.Parameters.AddWithValue("@username", username);

            try
            {
                int n;
                DataSet ds = db.GetDataSetUsingCmdObj(comm, out n);



                if (n < 0)
                {
                    return null;
                }

                byte[] cart = (byte[])ds.Tables[0].Rows[0]["CartData"];
                BinaryFormatter deser = new BinaryFormatter();
                MemoryStream stream = new MemoryStream(cart);

                Order order = (Order)deser.Deserialize(stream);

                return order;

            }
            catch (Exception ex)
            {
                return null;
            }

        }

        

    }
}

