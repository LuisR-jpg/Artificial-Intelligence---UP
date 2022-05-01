using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    class WriteQRCommand: Command
    {
        Store store;
        public WriteQRCommand(Store s)
        {
            store = s;
        }
        protected override void Run()
        {
            Store.StoreToQR(store);
        }
        protected override void SetDescription()
        {
            description = "Write QR for store: " + store.GetName();
        }
    }
}
