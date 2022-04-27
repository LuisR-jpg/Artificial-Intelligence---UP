using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class StoresFormBuilder: Builder
    {
        public override void CreateForm(int timesOpened)
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
            btnContinue.Click += BtnContinueClick;
            form.Controls.Add(btnContinue);

            Button btnAdd = new Button
            {
                Text = "Add Store",
                Size = new Size(100, 50),
                Location = new Point(25, form.Size.Height - 100)
            };
            btnAdd.Click += BtnAddClick;
            form.Controls.Add(btnAdd);

            Button btnGoBack = new Button
            {
                Text = "Go Back",
                Size = new Size(75, 35),
                Location = new Point((sizeStandard.Width - 75) / 2, sizeStandard.Height - 100 )
            };
            btnGoBack.Click += BtnGoBackClick;
            form.Controls.Add(btnGoBack);
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
        private void BtnContinueClick(object sender, EventArgs e)
        {
        }
        private void BtnAddClick(object sender, EventArgs e)
        {
            string message = "Do you have a QR for your store?";
            string title = "Add a new store";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);
            if (result == DialogResult.Yes)
            {
                Console.WriteLine("With QR");
            }
            else
            {
                Console.WriteLine("From scratch");
            }
        }
        private void BtnGoBackClick(object sender, EventArgs e)
        {
            GUI.CloseCurrentForm();
            GUI.SetNextPage(new WelcomeFormBuilder());
        }
    }
}
