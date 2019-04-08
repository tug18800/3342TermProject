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
        public DataSet GetDepartments()
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_GetDepartments";
            comm.CommandType = CommandType.StoredProcedure;

            DataSet ds;

            try
            {
                DBConnect db = new DBConnect();
                ds = db.GetDataSetUsingCmdObj(comm);
            }
            catch(Exception ex)
            {
                ds = null;
            }

            return ds;
        }

        // GET: api/service/5
        [HttpGet("GetProducts")]
        public DataSet GetProducts(int DeptID)
        {
            DataSet ds = new DataSet();

            return ds;
        }
        
        // POST: api/service
        [HttpPost("RegisterSite")]
        public bool RegisterSite([FromBody]string SiteID, string Description, string APIKey,
                         string Email, Merchant merchant )
        {
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
