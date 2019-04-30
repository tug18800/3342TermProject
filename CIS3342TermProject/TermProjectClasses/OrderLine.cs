using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    [Serializable]
    public class OrderLine
    {
        private int orderLineId;
        private Product item;
        private int quantity;
        private double price;
        private string merchantId;
        private string orderId;



        public OrderLine()
        {

        }

        public int OrderLineId { get => orderLineId; set => orderLineId = value; }
        public Product Item { get => item; set => item = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public double Price { get => price; set => price = value; }
        public string MerchantId { get => merchantId; set => merchantId = value; }
        public string OrderId { get => orderId; set => orderId = value; }
    }
}
