using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    class RaiseOrderCommand: Command
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
            GUI.LaunchPage(new RaiseOrderBuilder());
        }
        protected override void SetDescription()
        {
            description = "Store " + store.GetID().ToString() + ". Raise Order";
        }
    }
}
