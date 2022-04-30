using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    class DeliverCommand: Command
    {
        int storeID;
        public DeliverCommand(int storeID)
        {
            this.storeID = storeID;
        }
        protected override void Run()
        {
            Logistics.GetInstance().GetStore(storeID).hasOrder = false;
        }
        protected override void SetDescription()
        {
            description = "Deliver to store " + storeID.ToString();
        }
    }
}
