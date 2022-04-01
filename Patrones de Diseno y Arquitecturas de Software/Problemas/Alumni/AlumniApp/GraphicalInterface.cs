
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace AlumniApp
{
    public class GraphicalInterface
    {
        protected InstitutionalUser user;
        public static readonly Size formSize = new Size(620, 320);
        public GraphicalInterface()
        {
            user = InstitutionalUser.LogIn();
        }
        public void Options()
        {
            Form Options = CreateForm("Options");
            List<Button> buttons = user.GetOptions();
            Dictionary<string, EventHandler> events = new Dictionary<string, EventHandler>
            {
                { "Information", Information },
                { "Grades", Grades }
            };

            foreach (Button btn in buttons)
            {
                Console.WriteLine(btn.Name);
                btn.Click += new EventHandler(events[btn.Name]);
                Options.Controls.Add(btn);
            }
            Application.Run(Options);
        }
        public void Information(object sender, EventArgs e)
        {
            Form Information = CreateForm("Information");
            List<Control> items = user.GetInformation();
            foreach (Control i in items)
                Information.Controls.Add(i);
            Information.ShowDialog();
        }
        public void Grades(object sender, EventArgs e)
        {
            Form Grades = CreateForm("Grades");
            Grades.Controls.Add(user.GetGrades());
            Grades.ShowDialog();
        }
        private Form CreateForm(string title)
        {
            Form form = new Form
            {
                Size = formSize,
                Text = title,
                StartPosition = FormStartPosition.CenterScreen
            };
            return form;
        }
    }
}
