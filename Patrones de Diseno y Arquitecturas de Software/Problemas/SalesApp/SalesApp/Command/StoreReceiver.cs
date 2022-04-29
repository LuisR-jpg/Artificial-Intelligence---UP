using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    public class Store
    {
        private int id;
        private string name;
        private List<Product> productList;
        public Store(string name)
        {
            this.name = name;
        }
        public void SetID(int id)
        {
            this.id = id;
        }
        public int GetID()
        {
            return id;
        }
        public string GetName()
        {
            return name;
        }
        public void AddProduct(Product product)
        {

        }
        public void CreateQR()
        {

        }
    }
}
