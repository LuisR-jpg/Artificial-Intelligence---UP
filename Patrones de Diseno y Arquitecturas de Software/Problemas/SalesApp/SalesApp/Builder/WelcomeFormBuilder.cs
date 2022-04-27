using System;
using System.Windows.Forms;

namespace SalesApp

{
    class WelcomeFormBuilder: Builder
    {
        public override void CreateForm()
        {
            form = new Welcome();
            Builder.sizeStandard = form.Size;
            FormatForm(true);
        }
        public override void AddButtons() {}
        public override void AddOtherComponents() {}
    }
    public partial class Welcome : Form
    {
        private void BtnStartClick(object sender, EventArgs e)
        {
            this.Close();
            GUI.SetNextBuilder(new StoresFormBuilder());
        }

        private void BtnLogClick(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
