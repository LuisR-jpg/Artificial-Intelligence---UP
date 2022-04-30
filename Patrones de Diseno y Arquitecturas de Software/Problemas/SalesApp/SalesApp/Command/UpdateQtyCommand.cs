using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    public class UpdateQtyCommand: Command
    {
        Store store;
        UpdateQtyCommand(Store store, string product)
        {
            this.store = store;
        }
        protected override void Run()
        {
            
        }
        protected override void SetDescription()
        {
            description = "Updated Order";
        }
    }
}
