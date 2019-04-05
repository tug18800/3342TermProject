using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Utilities;
using TermProjectClasses;
using System.Data;

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
            DataSet ds = new DataSet();

            return ds;
        }

        // GET: api/service/5
        [HttpGet("GetProducts")]
        public DataSet Get(int DeptID)
        {
            DataSet ds = new DataSet();

            return ds;
        }
        
        // POST: api/service
        [HttpPost("RegisterSite")]
        public bool RegisterSite([FromBody]string SiteID, string Description, string APIKey,
                         string Email, Merchant merchant )
        {
            bool registered = false;

            return registered;
        }
        
        // PUT: api/service/5
        [HttpPost("RecordPurchase")]
        public bool RecordPurchase(string ProductID, int Quantity, string SellerSiteID, 
                                   string APIKey, Customer customer)
        {
            bool recorded  = false;

            return recorded;
        }
        
    }
}
