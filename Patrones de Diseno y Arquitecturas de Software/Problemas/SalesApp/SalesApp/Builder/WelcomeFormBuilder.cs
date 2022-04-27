using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp

{
    class WelcomeFormBuilder: Builder
    {
        public override void CreateForm(int timesOpened)
        {
            form = new Welcome();
            Builder.sizeStandard = form.Size;
            FormatForm(true);
            Button btnLog = form.Controls.Find("btnLog", false)[0] as Button;
            if (timesOpened <= 1) btnLog.Text = "Settings";
            else btnLog.Text = "View Log";
        }
        public override void AddButtons() {}
        public override void AddOtherComponents() {}
    }
    public partial class Welcome : Form
    {
        private void BtnStartClick(object sender, EventArgs e)
        {
            GUI.CloseCurrentForm();
            GUI.SetNextBuilder(new StoresFormBuilder());
        }

        private void BtnLogClick(object sender, EventArgs e)
        {
            GUI.SetNextBuilder(new LogSettingsFormBuilder());
        }
    }
}
