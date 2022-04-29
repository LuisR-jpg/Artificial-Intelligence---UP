using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    public sealed class Logistics
    {
        private static Logistics uniqueInstance;
        private List<Store> stores;
        private Logistics()
        {
            stores = new List<Store>();
        }
        public static Logistics GetInstance()
        {
            if (uniqueInstance == null)
            {
                uniqueInstance = new Logistics();
                uniqueInstance.ReadStores();
            }
            return uniqueInstance;
        }
        public void Simulate()
        {

        }
        public void CreateRoute()
        {

        }
        public void AddTruck()
        {

        }
        public void AddStore(string storeName)
        {
            Store s = new Store(storeName);
            s.SetID(stores.Count());
            stores.Add(s);
            StoresFormBuilder.storeView.SetStores(stores);
        }
        public void ReadStores()
        {
        }
        public List<Store> GetStores()
        {
            return stores;
        }
        public Store GetStore(int storeID)
        {
            if (storeID + 1 <= stores.Count())
                return stores[storeID];
            return null;
        }
    }
}
