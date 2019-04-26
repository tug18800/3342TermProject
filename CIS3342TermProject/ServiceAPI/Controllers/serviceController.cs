using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Utilities;
using System.Data;
using System.Data.SqlClient;
using ServiceAPI.Models;

namespace ServiceAPI.Controllers
{
    [Produces("application/json")]
    [Route("api/service/Merchants")]
    public class serviceController : Controller
    {
        // GET: api/service
        [HttpGet("GetDepartments")]
        public List<Department> GetDepartments()
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_GetDepartments";
            comm.CommandType = CommandType.StoredProcedure;

            DataSet ds;
            List<Department> dep = new List<Department>(); ;

            try
            {
                DBConnect db = new DBConnect();
                ds = db.GetDataSetUsingCmdObj(comm);

                DataRowCollection rows = ds.Tables[0].Rows;

                for (int i = 0; i < rows.Count; i++)
                {
                    Department d = new Department();
                    d.DeptID = (string)rows[i]["DepartmentID"];
                    d.DeptName = (string)rows[i]["DepartmentName"];
                    d.DeptImage = (string)rows[i]["DepartmentImage"];            
                    dep.Add(d);
                }
            }
            catch (Exception ex)
            {
                dep = null;
            }

            return dep;
        }

        // GET: api/service/5
        [HttpGet("GetProductCatalog/{deptID}")]
        public List<Product> GetProductCatalog(string deptID)
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_GetProductCatalog";
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@DepartmentID", deptID);
            DataSet ds;
            List<Product> list = new List<Product>();

            try
            {
                DBConnect db = new DBConnect();
                ds = db.GetDataSetUsingCmdObj(comm);

                DataRowCollection rows = ds.Tables[0].Rows;

                for (int i = 0; i < rows.Count; i++)
                {
                    Product p = new Product();

                    p.ProductID = (string)rows[i]["ProductID"];
                    p.Title = (string)rows[i]["Title"];
                    p.Description = (string)rows[i]["Desc"];
                    p.Price = (double)rows[i]["Price"];
                    p.Quantity = (int)rows[i]["Quantity"];
                    p.ImageUrl = (string)rows[i]["ImageURL"];
                    p.DepartmentID = (string)rows[i]["DepartmentID"];

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
        [HttpPost("RegisterSite/{SiteID}/{Description}/{APIKey}")]
        public bool RegisterSite(string SiteID, string Description, string APIKey, [FromBody]ContactInformation merchant)
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_RegisterSite";
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@SiteID", SiteID);
            comm.Parameters.AddWithValue("@APIKey", APIKey);
            comm.Parameters.AddWithValue("@Desc", Description);
            comm.Parameters.AddWithValue("@Name", merchant.Name);
            comm.Parameters.AddWithValue("@Address", merchant.Address);
            comm.Parameters.AddWithValue("@City", merchant.City);
            comm.Parameters.AddWithValue("@State", merchant.State);
            comm.Parameters.AddWithValue("@ZIP", merchant.ZipCode);
            comm.Parameters.AddWithValue("@Email", merchant.Email);
            comm.Parameters.AddWithValue("@Phone", merchant.Phone);

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
        [HttpPost("RecordPurchase/{ProductID}/{Quantity}/{SiteID}/{APIKey}")]
        public bool RecordPurchase(string ProductID, int Quantity, string SiteID, 
                                    string APIKey, [FromBody]Customer customer)
        {
            SqlCommand comm = new SqlCommand();
            comm.CommandText = "TP_RecordPurchase";
            comm.CommandType = CommandType.StoredProcedure;

            comm.Parameters.AddWithValue("@ProductID", ProductID);
            comm.Parameters.AddWithValue("@Quantity", Quantity);
            comm.Parameters.AddWithValue("@SiteID", SiteID);
            comm.Parameters.AddWithValue("@APIKey", APIKey);
            comm.Parameters.AddWithValue("@CustomerID", customer.CustomerID);
            comm.Parameters.AddWithValue("@Name", customer.Name);
            comm.Parameters.AddWithValue("@Address", customer.Address);
            comm.Parameters.AddWithValue("@City", customer.City);
            comm.Parameters.AddWithValue("@State", customer.State);
            comm.Parameters.AddWithValue("@ZIP", customer.ZipCode);
            comm.Parameters.AddWithValue("@Phone", customer.Phone);
            comm.Parameters.AddWithValue("@Email", customer.Email);


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
