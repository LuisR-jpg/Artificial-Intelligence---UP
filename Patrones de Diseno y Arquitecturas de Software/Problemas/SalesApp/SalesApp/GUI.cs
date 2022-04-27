using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    public class GUI
    {
        readonly FormsDirector director;
        private static Builder nextBuilder;
        private Builder currentBuilder;
        private static Form currentForm;
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
                currentForm = currentBuilder.ReturnForm();
                currentForm.ShowDialog();   
            }
        }
        public static void SetNextBuilder(Builder builder)
        {
            nextBuilder = builder;
        }
        public static void CloseCurrentForm()
        {
            currentForm.Close();
        }
    }
}
