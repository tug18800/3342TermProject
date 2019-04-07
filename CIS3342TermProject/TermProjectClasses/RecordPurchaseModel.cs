using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    public class RecordPurchaseModel
    {
        public string ProductID { get; set; }
        public int Quantity { get; set; }
        public string SellerSiteID { get; set; }
        public string APIKey { get; set; }
        public Customer customer { get; set; }

        public RecordPurchaseModel() { }

    }
}
