using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    public class Store
    {
        private readonly int id;
        private readonly string name;
        private List<Product> productList;
        public Store(int id, string name)
        {
            this.id = id;
            this.name = name;
        }
        public void AddProduct(Product product)
        {

        }
        public void CreateQR()
        {

        }
    }
}
