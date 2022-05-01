using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    class ReadQRCommand: Command
    {
        protected override void Run()
        {
            Logistics.GetInstance().ClearStores();
            Store.QRToStore();
        }
        protected override void SetDescription()
        {
            description = "Read QRs";
        }
    }
}
