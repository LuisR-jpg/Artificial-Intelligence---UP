using System;
using System.Windows.Forms;

namespace AlumniApp
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            GraphicalInterface GUI = new GraphicalInterface();
            GUI.Options();
        }
    } 
}
