using System;

namespace SalesApp
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Store store = new Store("jaa");
            Store.StoreToQR(store);
            Store.QRToStore();
            GUI gui = new GUI();
            gui.Run();
        }
    }
}
