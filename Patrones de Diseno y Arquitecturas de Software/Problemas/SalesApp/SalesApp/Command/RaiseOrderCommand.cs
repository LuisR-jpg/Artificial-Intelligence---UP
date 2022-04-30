namespace SalesApp
{
    class RaiseOrderCommand : Command
    {
        Store store;
        Logistics logistics;
        public RaiseOrderCommand(int storeID)
        {
            logistics = Logistics.GetInstance();
            this.store = logistics.GetStore(storeID);
        }
        protected override void Run()
        {
            logistics.SetCurrentStore(store);
            GUI.LaunchPage(new RaiseOrderBuilder());
            logistics.GetCurrentStore().canRaise = false;
        }
        protected override void SetDescription()
        {
            description = "Store " + store.GetID().ToString() + ". Raise Order";
        }
    }
}
