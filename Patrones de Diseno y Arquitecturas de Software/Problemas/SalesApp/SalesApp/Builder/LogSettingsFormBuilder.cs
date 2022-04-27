using System.Windows.Forms;
using System.Drawing;

namespace SalesApp
{
    class LogSettingsFormBuilder: Builder
    {
        int[] targetsQty;
        public override void CreateForm(int timesOpened)
        {
            form = new Form();
            FormatForm(true);
            form.AutoScroll = true;
        }
        public override void AddButtons()
        {
            string[] targetNames = { "Text File", "Grid", "Text Box" };
            targetsQty = new int[targetNames.Length];
            int offset = 75, width = 300, height = 100;
            for(int i = 0; i < targetNames.Length; i++)
            {
                Button b = new Button
                {
                    Location = new Point(GetHorizontalCenter(width), i * height + offset),
                    Size = new Size(width, height),
                    Text = targetNames[i], 
                };
                form.Controls.Add(b);
            }
        }
        public override void AddOtherComponents() {}
    }
}
