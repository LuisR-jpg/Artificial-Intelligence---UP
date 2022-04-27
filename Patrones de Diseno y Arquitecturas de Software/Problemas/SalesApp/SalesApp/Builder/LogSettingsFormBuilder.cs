using System.Windows.Forms;
using System.Drawing;
using System;

namespace SalesApp
{
    class LogSettingsFormBuilder: Builder
    {
        static string[] targetNames = { "Text File", "Grid", "Text Box" };
        static int[] targetsQty = new int[targetNames.Length];

        public override void CreateForm(int timesOpened)
        {
            form = new Form();
            FormatForm(true);
            form.AutoScroll = true;
            Button btnReset = new Button
            {
                Location = new Point(sizeStandard.Width - 100, 10),
                Text = "Reset"
            };
            btnReset.Click += BtnResetClick;
            form.Controls.Add(btnReset);
        }
        public override void AddButtons()
        {
            int offset = 75, width = 300, height = 100;
            for(int i = 0; i < targetNames.Length; i++)
            {
                Button b = new Button
                {
                    Location = new Point(GetHorizontalCenter(width), i * height + offset),
                    Size = new Size(width, height),
                    Text = GetButtonName(i), 
                    Name = i.ToString()
                };
                b.Click += BtnTargetClick;
                form.Controls.Add(b);
            }
        }
        private string GetButtonName(int i)
        {
            string extra = "";
            if (targetsQty[i] > 0) extra = " (x" + targetsQty[i].ToString() + ")";
            return targetNames[i] + extra;
        }
        private void BtnTargetClick(object s, EventArgs e)
        {
            Button b = (s as Button);
            int index = int.Parse(b.Name);
            targetsQty[index]++;
            b.Text = GetButtonName(index);
        }
        private void BtnResetClick(object s, EventArgs e)
        {
            Array.Clear(targetsQty, 0, targetsQty.Length);
            GUI.LaunchPage(new LogSettingsFormBuilder());
            form.Close();
        }
        public override void AddOtherComponents() {}
    }
}
