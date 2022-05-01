using System.Collections.Generic;
using System.Linq;

namespace SalesApp
{
    public sealed class Logistics
    {
        private static Logistics uniqueInstance;
        private List<Store> stores;
        private Store currentStore;
        private readonly int nTrucksMax = 5;
        private readonly int nSameClassTrucksMax = 3;
        private readonly int breadTruckCapacity = 270;
        private readonly int sodaTruckCapacity = 120;
        private readonly int vegetableTruckCapacity = 95;
        private string simulationAnswer;
        private Logistics()
        {
            stores = new List<Store>();
        }
        public static Logistics GetInstance()
        {
            if (uniqueInstance == null)
            {
                uniqueInstance = new Logistics();
            }
            return uniqueInstance;
        }
        public bool Simulate(int tV, int tB, int tS)
        {
            int vQty = 0, bQty = 0, sQty = 0;
            if (tV + tB + tS > nTrucksMax)
            {
                simulationAnswer = "Exceeded number of trucks";
                return false;
            }
            if (tV > nSameClassTrucksMax)
            {
                simulationAnswer = "Exceeded number of vegetables trucks";
                return false;
            }
            if (tB > nSameClassTrucksMax)
            {
                simulationAnswer = "Exceeded number of bread trucks";
                return false;
            }
            if (tS > nSameClassTrucksMax)
            {
                simulationAnswer = "Exceeded number of sodas trucks";
                return false;
            }
            tV *= vegetableTruckCapacity;
            tB *= breadTruckCapacity;
            tS *= sodaTruckCapacity;
            foreach (Store s in stores)
            {
                vQty += s.GetVegetablesQty();
                bQty += s.GetBreadsQty();
                sQty += s.GetSodasQty();
                if (s.GetRevenue() > 0)
                    s.hasOrder = true;
            }
            if (tV + tS + tB < 1 && vQty + bQty + sQty >= 1)
            {
                simulationAnswer = "You need to send at least one truck";
                return false;
            }
            if (vQty > tV)
            {
                simulationAnswer = "Not enough trucks of vegetables";
                return false;
            }
            if (sQty > tS)
            {
                simulationAnswer = "Not enough trucks of sodas";
                return false;
            }
            if (bQty > tB)
            {
                simulationAnswer = "Not enough trucks of bread";
                return false;
            }
            if (vQty <= tV && bQty <= tB && sQty <= tS)
            {
                simulationAnswer = "\t" + (tV - vQty).ToString() + " Kg of vegetables will remain" + "\n\t" + (tS - sQty).ToString() + " Cans of soda will remain" + "\n\t" + (tB - bQty).ToString() + " Pieces of bread will remain";
                return true;
            }
            return false;
        }
        public string GetSimulationMessage()
        {
            return simulationAnswer;
        }
        private void AddStore(Store s)
        {
            stores.Add(s);
            StoresFormBuilder.storeView.SetStores(stores);
        }
        public void AddStore(int storeID, string storeName)
        {
            Store s = new Store(storeName);
            if (storeID == -1)
            {
                s.SetID(stores.Count);
                AddStore(s);
            }
            else
            {
                s.SetID(storeID);
                stores.Add(s);
            }
        }
        public void AddStore(int storeID, string storeName, int nV, int nB, int nS)
        {
            Store s = new Store(storeName);
            if (storeID == -1) s.SetID(stores.Count);
            else s.SetID(storeID);
            s.SetBreadsQty(nB);
            s.SetSodasQty(nS);
            s.SetVegetablesQty(nV);
            stores.Add(s);
        }
        public List<Store> GetStores()
        {
            return stores;
        }
        public void CreateRoute()
        {
            stores.Sort(new StoresComparer());
        }
        public Store GetStore(int storeID)
        {
            return stores.Where(i => i.GetID() == storeID).First();
        }
        public void SetCurrentStore(Store store)
        {
            currentStore = store;
        }
        public Store GetCurrentStore()
        {
            return currentStore;
        }
        public void ClearStores()
        {
            stores.Clear();
        }
    }
}
