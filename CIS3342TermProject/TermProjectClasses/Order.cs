using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    public class Order
    {
        private List<OrderLine> items;

        public Order()
        {

        }

        public List<OrderLine> Items { get => items; set => items = value; }

        public double GetTotalPrice()
        {
            double totalPrice = 0;
            foreach(OrderLine item in items)
            {

                totalPrice += item.Price * item.Quantity;
            }

            return totalPrice;
        }
    }
}
