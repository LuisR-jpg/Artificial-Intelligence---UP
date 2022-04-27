using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    public class GUI
    {
        readonly FormsDirector director;
        private static Builder nextBuilder;
        Builder currentBuilder;
        public GUI()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            director = new FormsDirector();
        }
        public void Run()
        {
            for(nextBuilder = new WelcomeFormBuilder(); currentBuilder != nextBuilder;)
            {
                currentBuilder = nextBuilder;
                director.SetBuilder(currentBuilder);
                director.Build();
                Form form = currentBuilder.ReturnForm();
                form.ShowDialog();   
            }
        }
        public static void SetNextBuilder(Builder builder)
        {
            nextBuilder = builder;
        }

    }
}
