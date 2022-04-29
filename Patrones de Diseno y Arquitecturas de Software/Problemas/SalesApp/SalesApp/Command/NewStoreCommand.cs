using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    public class NewStoreCommand : Command
    {
        private Logistics logistics;
        private string storeName;
        public NewStoreCommand(string storeName)
        {
            logistics = Logistics.GetInstance();
            this.storeName = storeName;
        }
        protected override void Run()
        {
            logistics.AddStore(storeName);
        }
        protected override void SetDescription()
        {
            description = "New store command";
        }
    }
}
