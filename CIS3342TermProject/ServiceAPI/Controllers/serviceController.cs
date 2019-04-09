using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Utilities;
using TermProjectClasses;
using System.Data;
using System.Data.SqlClient;

namespace ServiceAPI.Controllers
{
    [Produces("application/json")]
    [Route("api/service/Merchant")]
    public class serviceController : Controller
    {
        // GET: api/service
        [HttpGet("GetDepartments")]
        public List<string> GetDepartments()
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_GetDepartments";
            comm.CommandType = CommandType.StoredProcedure;

            DataSet ds;
            List<string> dep = new List<string> (); ;

            try
            {
                DBConnect db = new DBConnect();
                ds = db.GetDataSetUsingCmdObj(comm);

                DataRowCollection rows = ds.Tables[0].Rows;

                for(int i = 0; i < rows.Count; i++)
                {
                    dep.Add((string)rows[i]["DepartmentName"]);
                }
            }
            catch(Exception ex)
            {
                dep = null;
            }

            return dep;
        }

        // GET: api/service/5
        [HttpGet("GetProducts")]
        public List<Product> GetProducts(int DeptID)
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_GetProductCatalog";
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@DepartmentID", DeptID);
            DataSet ds;
            List<Product> list = new List<Product>();

            try
            {
                DBConnect db = new DBConnect();
                ds = db.GetDataSetUsingCmdObj(comm);

                DataRowCollection rows = ds.Tables[0].Rows;

                for(int i =0; i < rows.Count; i++)
                {
                    Product p = new Product();

                    p.ProductID = (int)rows[i]["ProductID"];
                    p.Desc = (string)rows[i]["Desc"];
                    p.Price = (double)rows[i]["Price"];
                    p.Url = (string)rows[i]["ProductURL"];

                    list.Add(p);
                }
            }
            catch (Exception ex)
            {
                list = null;
            }

            return list;
        }
        
        // POST: api/service
        [HttpPost("RegisterSite")]
        public bool RegisterSite(string SiteID, string Description, string APIKey,
                         string Email, Merchant merchant)
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_RegisterSite";
            comm.CommandType = CommandType.StoredProcedure;
;
            comm.Parameters.AddWithValue("@SiteID", SiteID);
            comm.Parameters.AddWithValue("@APIKey", APIKey);
            comm.Parameters.AddWithValue("@Desc", Description);
            comm.Parameters.AddWithValue("@Email", Email);
            comm.Parameters.AddWithValue("@Phone", merchant.Phone);
            comm.Parameters.AddWithValue("@Address", merchant.Address);
            comm.Parameters.AddWithValue("@City", merchant.City);
            comm.Parameters.AddWithValue("@State", merchant.State);
            comm.Parameters.AddWithValue("@ZIP", merchant.ZIP);

            try
            {
                DBConnect db = new DBConnect();
                int rowsAffected = db.DoUpdateUsingCmdObj(comm);

                if (rowsAffected > 0)
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

            return false;
        }

        // PUT: api/service/5
        [HttpPost("RecordPurchase")]
        public bool RecordPurchase(string ProductID, int Quantity, string SiteID, 
                                   string APIKey, Customer customer)
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_RecordPurchase";
            comm.CommandType = CommandType.StoredProcedure;

            comm.Parameters.AddWithValue("@ProductID", ProductID);
            comm.Parameters.AddWithValue("@Quantity", Quantity);
            comm.Parameters.AddWithValue("@SiteID", SiteID);
            comm.Parameters.AddWithValue("@APIKey", APIKey);
            comm.Parameters.AddWithValue("@CustomerID", customer.CustomerID);
            comm.Parameters.AddWithValue("@FirstName", customer.FirstName);
            comm.Parameters.AddWithValue("@LastName", customer.LastName);
            comm.Parameters.AddWithValue("@Age", customer.Age);
            comm.Parameters.AddWithValue("@Phone", customer.Phone);
            comm.Parameters.AddWithValue("@Address", customer.Address);
            comm.Parameters.AddWithValue("@City", customer.City);
            comm.Parameters.AddWithValue("@State", customer.State);
            comm.Parameters.AddWithValue("@ZIP", customer.ZIP);

            try
            {
                DBConnect db = new DBConnect();
                int rowsAffected = db.DoUpdateUsingCmdObj(comm);

                if(rowsAffected > 0)
                {
                    return true;
                }
            }
            catch(Exception ex)
            {
                return false;
            }

            return false;
        }
        
    }
}
