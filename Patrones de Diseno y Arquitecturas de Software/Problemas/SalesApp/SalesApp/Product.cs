using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    public class Product
    {
        private readonly int id;
        private readonly string name;
        private readonly float price;
        public Product(int id, string name, float price)
        {
            this.id = id;
            this.name = name;
            this.price = price;
        }
    }
}
