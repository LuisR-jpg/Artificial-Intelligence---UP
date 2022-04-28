using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class WelcomeFormBuilder: Builder
    {
        public static bool isFirstTime = true;
        public override void CreateForm(int timesOpened)
        {
            form = new Welcome();
            Builder.sizeStandard = form.Size;
            FormatForm(true);
            isFirstTime = timesOpened <= 1;
        }
        public override void AddButtons()
        {
            Button btnLog = form.Controls.Find("btnLog", false)[0] as Button;
            if (isFirstTime) btnLog.Text = "Settings";
            else btnLog.Text = "View Log";
        }
        public override void AddOtherComponents() {}
    }
    public partial class Welcome : Form
    {
        private void BtnStartClick(object sender, EventArgs e)
        {
            GUI.CloseCurrentForm();
            GUI.SetNextPage(new StoresFormBuilder());
        }

        private void BtnLogClick(object sender, EventArgs e)
        {
            if(WelcomeFormBuilder.isFirstTime)
                GUI.LaunchPage(new LogSettingsFormBuilder());
        }
    }
}
