using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class StoresFormBuilder: Builder
    {
        public override void CreateForm()
        {
            form = new Form();
            FormatForm(false);
        }
        public override void AddButtons()
        {
            Button btnContinue = new Button
            {
                Text = "Continue",
                Enabled = false,
                Size = new Size(100, 50),
                Location = new Point(form.Size.Width - 125, form.Size.Height - 100)
            };
            form.Controls.Add(btnContinue);
            Button btnAdd = new Button
            {
                Text = "Add Store",
                Size = new Size(100, 50),
                Location = new Point(25, form.Size.Height - 100)
            };
            form.Controls.Add(btnAdd);
        }
        public override void AddOtherComponents()
        {
            Panel p = new Panel
            {
                Size = new Size(Builder.sizeStandard.Width - 100, Builder.sizeStandard.Height - 150),
                Location = new Point(50, 25),
                AutoScroll = true,
                BackColor = Color.White
            };
            form.Controls.Add(p);
        }
    }
}
