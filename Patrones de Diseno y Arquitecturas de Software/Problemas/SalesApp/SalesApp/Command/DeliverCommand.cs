using System.Windows.Forms;

namespace SalesApp
{
    class DeliverCommand : Command
    {
        int storeID;
        public DeliverCommand(int storeID)
        {
            this.storeID = storeID;
        }
        protected override void Run()
        {
            Store s = Logistics.GetInstance().GetStore(storeID);
            MessageBox.Show("Delivered: \n" + "\n\t" + s.GetSodasQty().ToString() + " cans of soda." + "\n\t" + s.GetBreadsQty() + " Pieces of bread." + "\n\t" + s.GetVegetablesQty() + " kg of vegetables.", s.GetName(), MessageBoxButtons.OK);
            Logistics.GetInstance().GetStore(storeID).hasOrder = false;
        }
        protected override void SetDescription()
        {
            description = "Deliver to store " + storeID.ToString();
        }
    }
}
