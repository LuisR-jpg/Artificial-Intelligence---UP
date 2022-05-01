using System;

namespace SalesApp
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            GUI gui = new GUI();
            gui.Run();
        }
    }
}
