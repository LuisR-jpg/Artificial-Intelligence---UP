
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace AlumniApp
{
    public class GraphicalInterface
    {
        protected InstitutionalUser user;
        public GraphicalInterface()
        {
            user = InstitutionalUser.LogIn();
        }
        public void Options()
        {
            Form Options = CreateForm("Options");
            List<Button> buttons = user.GetOptions();
            foreach(Button btn in buttons)
            {
                btn.Click += new EventHandler(Information);
                Options.Controls.Add(btn);
            }
            Application.Run(Options);
        }
        public void Information(object sender, EventArgs e)
        {
            Form Information = CreateForm("Information");
            Information.Controls.Add(user.Information());
            Information.ShowDialog();
        }
        public void Grades()
        {

        }
        private Form CreateForm(string title)
        {
            Form form = new Form();
            form.Size = new Size(620, 320);
            form.Text = title;
            return form;
        }
    }
}
