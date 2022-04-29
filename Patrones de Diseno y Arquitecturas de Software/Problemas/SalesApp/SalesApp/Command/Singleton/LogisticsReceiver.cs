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
                uniqueInstance = new Logistics();
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
        public void AddStore()
        {

        }
    }
}
