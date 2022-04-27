using System;
using System.Drawing;
using System.Windows.Forms;


namespace SalesApp
{
    public class GUI
    {
        private static Size sizeStandard;  
        public GUI()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            this.Execute();
        }
        private static Form FormatForm(Form form, bool hasExitButton)
        {
            form.StartPosition = FormStartPosition.CenterScreen;
            form.FormBorderStyle = FormBorderStyle.FixedDialog;
            form.MaximizeBox = false;
            form.MinimizeBox = false;
            form.Size = GUI.sizeStandard;
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
            return form;
        }
        private void Execute()
        {
            Form welcome = new Welcome();
            sizeStandard = welcome.Size;
            welcome = FormatForm(welcome, true);
            Application.Run(welcome);
        }
        public static Form CreateStoresForm()
        {
            Form form = new Form();
            form = FormatForm(form, false);
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
            Panel p = new Panel
            {
                Size = new Size(GUI.sizeStandard.Width - 100, GUI.sizeStandard.Height - 150),
                Location = new Point(50, 25),
                AutoScroll = true,
                BackColor = Color.White
            };
            form.Controls.Add(p);
            return form;
        }
    }
}
