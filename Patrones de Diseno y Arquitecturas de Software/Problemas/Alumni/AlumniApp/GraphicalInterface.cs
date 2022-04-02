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
            Form Options = user.CreateForm("Options", "Exit");
            Dictionary<string, EventHandler> events = new Dictionary<string, EventHandler>
            {
                { "Information", Information },
                { "Grades", Grades }
            };
            Options.Controls.Add(user.CreateLabel("Your Options"));
            List<Button> buttons = user.GetOptions();
            foreach (Button btn in buttons)
            {
                btn.Click += new EventHandler(events[btn.Name]);
                Options.Controls.Add(btn);
            }
            Options.ShowDialog();
        }
        public void Information(object sender, EventArgs e)
        {
            Form Information = user.CreateForm("Information", "Go Back");
            List<Control> items = user.GetInformation();
            foreach (Control i in items)
                Information.Controls.Add(i);
            Information.ShowDialog();
        }
        public void Grades(object sender, EventArgs e)
        {
            Form Grades = user.CreateForm("Grades", "Go Back");
            List<Control> grades = user.GetGrades();
            foreach (Control control in grades)
            {
                if (control.Name == "Download")
                    control.Click += new EventHandler(Download);
                Grades.Controls.Add(control);
            }
            Grades.ShowDialog();
        }
        public void Download(object sender, EventArgs e)
        {
            Export export = Export.GetInstance();
            bool success = export.Write(user.GetName(), user.DownloadGrades());
            string eMessage, eCaption;
            MessageBoxButtons button = MessageBoxButtons.OK;
            if (success) {
                eCaption = "Success";
                eMessage = "Your file is now in your Desktop folder!";
            }
            else 
            {
                eCaption = "Failed";
                eMessage = "Make sure there's no any previous file opened.";
            }
            MessageBox.Show(eMessage, eCaption, button);
        }
    }
}
