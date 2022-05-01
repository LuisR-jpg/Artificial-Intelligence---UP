namespace SalesApp
{
    public class NewStoreCommand : Command
    {
        private Logistics logistics;
        private string storeName;
        private int storeID;
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
        protected override void Run()
        {
            logistics.AddStore(storeID, storeName);
        }
        protected override void SetDescription()
        {
            description = "New store command";
        }
    }
}
