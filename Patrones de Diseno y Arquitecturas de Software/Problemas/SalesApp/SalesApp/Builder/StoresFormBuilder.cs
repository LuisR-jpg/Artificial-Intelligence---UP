using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class StoresFormBuilder: Builder
    {
        public static MyPanel storeView;
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
            storeView = new MyPanel();
            form.Controls.Add(storeView.GetPanel());
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
                Console.WriteLine("Not Implemented Yet");
                /*
                OpenFileDialog fileChooser = new OpenFileDialog();
                if (fileChooser.ShowDialog() == DialogResult.OK)
                {
                    Console.WriteLine(fileChooser.FileName);
                }
                */
            }
            else
            {
                GUI.LaunchPage(new InputStoreBuilder());
                storeView.NewStoreToPanel();
            }

        }
        private void BtnGoBackClick(object sender, EventArgs e)
        {
            GUI.CloseCurrentForm();
            GUI.SetNextPage(new WelcomeFormBuilder());
        }
        public class MyPanel
        {
            private Panel panel;
            private int nElements;
            private readonly int elementsHeight;
            private string storeName;
            public MyPanel()
            {
                elementsHeight = 25;
                int width = Builder.sizeStandard.Width - 515;
                panel = new Panel
                {
                    Size = new Size(width, Builder.sizeStandard.Height - 150),
                    Location = new Point((Builder.sizeStandard.Width - width) / 2, 25),
                    AutoScroll = true,
                    BackColor = Color.White
                };
            }
            public Panel GetPanel()
            {
                return panel;
            }
            public void NewStoreToPanel()
            {

                Label lblNewStore = new Label
                {
                    Text = nElements.ToString() + ". " + storeName,
                    Location = new Point(50, elementsHeight * (nElements + 1))
                };
                panel.Controls.Add(lblNewStore);
                Button btnNewStore = new Button
                {
                    Text = "Raise Order",
                    Name = nElements.ToString(),
                    Location = new Point(150, elementsHeight * (nElements + 1) - 5)
                };
                btnNewStore.Click += BtnNewStoreClick;
                panel.Controls.Add(btnNewStore);
                NewRow();
            }
            private void NewRow()
            {
                nElements++;
            }
            public void SetStoreName(string s)
            {
                storeName = s;
            }
            private void BtnNewStoreClick(object sender, EventArgs e)
            {
                Button b = sender as Button;
            }
        }
    }
}
