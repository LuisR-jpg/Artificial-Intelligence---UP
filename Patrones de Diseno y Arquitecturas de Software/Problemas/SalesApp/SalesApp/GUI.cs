using System.Windows.Forms;

namespace SalesApp
{
    public class GUI
    {
        private static Builder nextBuilder;
        private static Form currentForm;
        private static FormsDirector director;
        private Builder currentBuilder;
        public GUI()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            director = new FormsDirector();
        }
        public void Run()
        {
            for (nextBuilder = new WelcomeFormBuilder(); currentBuilder != nextBuilder;)
            {
                currentBuilder = nextBuilder;
                director.SetBuilder(currentBuilder);
                director.Build();
                currentForm = currentBuilder.ReturnForm();
                currentForm.ShowDialog();
            }
        }
        public static void SetNextPage(Builder builder)
        {
            nextBuilder = builder;
        }
        public static void LaunchPage(Builder builder)
        {
            director.SetBuilder(builder);
            director.Build();
            Form form = builder.ReturnForm();
            form.ShowDialog();
        }
        public static void CloseCurrentForm()
        {
            currentForm.Close();
        }
        public static Form GetCurrentForm()
        {
            return currentForm;
        }
    }
}
