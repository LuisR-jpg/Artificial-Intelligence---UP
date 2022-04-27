using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    public class GUI
    {
        readonly FormsDirector director;
        public static Builder nextBuilder;
        Builder currentBuilder;
        public GUI()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            director = new FormsDirector();
        }
        public void Run()
        {
            for(currentBuilder = new WelcomeFormBuilder(); currentBuilder != nextBuilder; currentBuilder = nextBuilder)
            {
                director.SetBuilder(currentBuilder);
                director.Build();
                Form form = currentBuilder.ReturnForm();
                form.ShowDialog();   
            }
        }


    }
}
