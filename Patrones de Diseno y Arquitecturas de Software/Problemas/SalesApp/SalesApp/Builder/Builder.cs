using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    public abstract class Builder
    {
        protected Form form;
        protected static Size sizeStandard;
        public abstract void CreateForm();
        public abstract void AddButtons();
        public abstract void AddOtherComponents();
        public Form ReturnForm()
        {
            return form;
        }
        protected void FormatForm(bool hasExitButton)
        {
            form.StartPosition = FormStartPosition.CenterScreen;
            form.FormBorderStyle = FormBorderStyle.FixedDialog;
            form.MaximizeBox = false;
            form.MinimizeBox = false;
            form.Size = Builder.sizeStandard;
            if (hasExitButton)
            {
                Button btnLogOut = new Button
                {
                    Text = "Exit",
                    Location = new Point(10, 10)
                };
                btnLogOut.Click += (object s, EventArgs e) => form.Close();
                form.Controls.Add(btnLogOut);
            }
        }
    }
}
