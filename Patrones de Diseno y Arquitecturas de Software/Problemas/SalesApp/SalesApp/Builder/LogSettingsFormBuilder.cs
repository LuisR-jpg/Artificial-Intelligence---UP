using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class LogSettingsFormBuilder : Builder
    {
        Logger logger;
        string[] targetNames;
        public override void CreateForm(int timesOpened)
        {
            form = new Form();
            FormatForm(true);
            form.AutoScroll = true;
            logger = Logger.GetInstance();
            targetNames = logger.GetTargetNames();
        }
        public override void AddButtons()
        {
            int offset = 75, width = 300, height = 100;
            for (int i = 0; i < targetNames.Length; i++)
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
            Button btnReset = new Button
            {
                Location = new Point(sizeStandard.Width - 100, 10),
                Text = "Reset"
            };
            btnReset.Click += BtnResetClick;
            form.Controls.Add(btnReset);
        }
        private string GetButtonName(int i)
        {
            string extra = "";
            if (logger.targetsQty[i] > 0) extra = " (x" + logger.targetsQty[i].ToString() + ")";
            return targetNames[i] + extra;
        }
        private void BtnTargetClick(object s, EventArgs e)
        {
            Button b = (s as Button);
            int index = int.Parse(b.Name);
            logger.targetsQty[index]++;
            b.Text = GetButtonName(index);
        }
        private void BtnResetClick(object s, EventArgs e)
        {
            Array.Clear(logger.targetsQty, 0, logger.targetsQty.Length);
            GUI.LaunchPage(new LogSettingsFormBuilder());
            form.Close();
        }
        public override void AddOtherComponents() { }
    }
}
