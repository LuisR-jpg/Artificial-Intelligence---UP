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
        Product sodas, vegetables, breads;
        public bool canRaise, hasOrder;
        public Store(string name)
        {
            this.name = name;
            sodas = new Sodas();
            vegetables = new FrozenVegetables();
            breads = new Breads();
            canRaise = true;
            hasOrder = false;
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
        public void SetSodasQty(int qty)
        {
            sodas.SetQty(qty);
        }
        public void SetVegetablesQty(int qty)
        {
            vegetables.SetQty(qty);
        }
        public void SetBreadsQty(int qty)
        {
            breads.SetQty(qty);
        }
        public int GetSodasQty()
        {
            return sodas.GetQty();
        }
        public int GetVegetablesQty()
        {
            return vegetables.GetQty();
        }
        public int GetBreadsQty()
        {
            return breads.GetQty();
        }
        public void CreateQR()
        {

        }
        public float GetRevenue()
        {
            return GetSodasQty() * sodas.GetPrice() + GetBreadsQty() * breads.GetPrice() + GetVegetablesQty() * vegetables.GetPrice();
        }
    }
    public class StoresComparer : IComparer<Store>
    {
        public int Compare(Store a, Store b)
        {
            return -1 * a.GetRevenue().CompareTo(b.GetRevenue());
        }
    }
}
