using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    public class InputStoreBuilder : Builder
    {
        TextBox inputName;
        public override void CreateForm(int timesOpened)
        {
            form = new Form();
            FormatForm(false);
            form.Size = new Size(250, 150);
            form.Text = "Create Store";
        }
        public override void AddButtons()
        {
            Button btnCreate = new Button
            {
                Text = "Create",
                Location = new Point(150, 80)
            };
            btnCreate.Click += BtnCreateClick;
            form.Controls.Add(btnCreate);
        }
        public override void AddOtherComponents()
        {
            Label lbl = new Label
            {
                Location = new Point(15, 15),
                Text = "Include the name of the store:",
                AutoSize = true
            };
            form.Controls.Add(lbl);
            int inputWidth = 80, inputHeight = 30;
            inputName = new TextBox
            {
                Location = new Point(GetHorizontalCenter(inputWidth), 45),
                Text = "new Store",
                Size = new Size(inputWidth, inputHeight)
            };
            form.Controls.Add(inputName);
        }
        private void BtnCreateClick(object s, EventArgs e)
        {
            StoresFormBuilder.storeView.SetStoreName(inputName.Text);
            form.Close();
        }
        protected override int GetHorizontalCenter(int width)
        {
            return (form.Size.Width - width) / 2;
        }
    }
}
