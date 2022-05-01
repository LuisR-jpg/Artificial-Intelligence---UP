namespace SalesApp
{
    public class NewStoreCommand : Command
    {
        private Logistics logistics;
        private string storeName;
        private int storeID, nV, nB, nS;
        private bool hasProducts = false;
        public NewStoreCommand(string storeName)
        {
            logistics = Logistics.GetInstance();
            this.storeName = storeName;
            storeID = -1;
        }
        public NewStoreCommand(int storeID, string storeName)
        {
            logistics = Logistics.GetInstance();
            this.storeID = storeID;
            this.storeName = storeName;
        }
        public NewStoreCommand(int storeID, string storeName, int nVegetables, int nBreads, int nSodas)
        {
            logistics = Logistics.GetInstance();
            this.storeID = storeID;
            this.storeName = storeName;
            this.nV = nVegetables;
            this.nB = nBreads;
            this.nS = nSodas;
            hasProducts = true;
        }
        protected override void Run()
        {
            if (hasProducts) logistics.AddStore(storeID, storeName, nV, nB, nS);
            else logistics.AddStore(storeID, storeName);
        }
        protected override void SetDescription()
        {
            description = "New store command";
        }
    }
}
