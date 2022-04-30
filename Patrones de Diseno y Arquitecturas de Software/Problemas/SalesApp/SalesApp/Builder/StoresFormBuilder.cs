using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class StoresFormBuilder : Builder
    {
        public static MyPanel storeView;
        private bool isFirstTime;
        private static Button btnContinue;
        public override void CreateForm(int timesOpened)
        {
            form = new Form();
            FormatForm(false);
            isFirstTime = timesOpened <= 1;
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
            StoresFormBuilder.btnContinue = btnContinue;
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
                Location = new Point((sizeStandard.Width - 75) / 2, sizeStandard.Height - 100)
            };
            btnGoBack.Click += BtnGoBackClick;
            if (!isFirstTime)
                form.Controls.Add(btnGoBack);
        }
        public override void AddOtherComponents()
        {
            storeView = new MyPanel(isFirstTime);
            form.Controls.Add(storeView.GetPanel());
        }
        private void BtnContinueClick(object sender, EventArgs e)
        {
            GUI.CloseCurrentForm();
            GUI.SetNextPage(new RouteCreatorBuilder());
        }
        private void BtnAddClick(object sender, EventArgs e)
        {
            /*
            string message = "Do you have a QR for the store?";
            string title = "Add a new store";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);
            if (result == DialogResult.Yes)
            {
                Console.WriteLine("Not Implemented Yet");
                OpenFileDialog fileChooser = new OpenFileDialog();
                if (fileChooser.ShowDialog() == DialogResult.OK)
                {
                    Console.WriteLine(fileChooser.FileName);
                }
            }
            else
            {
        */
            GUI.LaunchPage(new InputStoreBuilder());
        }
        private void BtnGoBackClick(object sender, EventArgs e)
        {
            GUI.CloseCurrentForm();
            GUI.SetNextPage(new WelcomeFormBuilder());
        }
        public class MyPanel
        {
            private readonly Panel panel;
            private readonly int elementsHeight;
            private bool isFirstTime = true;
            public int storesToRaise;
            private int count = 0, currentStore = 0;
            Logistics l;
            public MyPanel(bool isFirstTime)
            {
                this.isFirstTime = isFirstTime;
                elementsHeight = 25;
                int width = Builder.sizeStandard.Width - 515;
                panel = new Panel
                {
                    Size = new Size(width, Builder.sizeStandard.Height - 150),
                    Location = new Point((Builder.sizeStandard.Width - width) / 2, 25),
                    AutoScroll = true,
                    BackColor = Color.White
                };
                if (!isFirstTime)
                {
                    l = Logistics.GetInstance();
                    l.SetCurrentStore(l.GetStores()[0]);
                    currentStore = 1;
                }
                SetStores(Logistics.GetInstance().GetStores());
                storesToRaise = 0;
            }
            public Panel GetPanel()
            {
                return panel;
            }
            public void NewStoreToPanel(Store s)
            {
                bool isEnabled;
                string text;
                if (isFirstTime)
                {
                    isEnabled = s.canRaise;
                    text = "Raise Order";
                }
                else
                {
                    text = (s.hasOrder ? "Deliver" : "Raise Order");
                    isEnabled = (s == l.GetCurrentStore());
                }
                Label lblStore = new Label
                {
                    Text = s.GetID().ToString() + ". " + s.GetName(),
                    Location = new Point(50, elementsHeight * count)
                };
                panel.Controls.Add(lblStore);
                Button btnOrder = new Button
                {
                    Text = text,
                    Name = s.GetID().ToString(),
                    Location = new Point(150, elementsHeight * count - 5),
                    Enabled = isEnabled
                };
                btnOrder.Click += BtnOrderClick;
                panel.Controls.Add(btnOrder);
                count++;
            }
            public void SetStores(List<Store> list)
            {
                count = 1;
                panel.Controls.Clear();
                StoresFormBuilder.DisableContinue();
                storesToRaise = list.Count;
                foreach (Store s in list)
                {
                    NewStoreToPanel(s);
                    if (s.canRaise == false)
                        storesToRaise--;
                }
                if ((list.Count > 0 && storesToRaise == 0 && isFirstTime) || (!isFirstTime && l.GetCurrentStore() == null))
                    StoresFormBuilder.EnableContinue();
            }
            private void BtnOrderClick(object sender, EventArgs e)
            {
                Button b = sender as Button;
                if (b.Text == "Raise Order")
                {
                    Command command = new RaiseOrderCommand(int.Parse(b.Name));
                    SalesManager manager = new SalesManager(command);
                    manager.Execute();
                    b.Enabled = false;
                    if (!isFirstTime)
                    {
                        if (currentStore < l.GetStores().Count)
                            l.SetCurrentStore(l.GetStores()[currentStore++]);
                        else l.SetCurrentStore(null);
                    }
                }
                else
                {
                    Command command = new DeliverCommand(int.Parse(b.Name));
                    SalesManager manager = new SalesManager(command);
                    manager.Execute();
                    b.Text = "Raise Order";
                }
                SetStores(Logistics.GetInstance().GetStores());
            }
        }
        public static void EnableContinue()
        {
            StoresFormBuilder.btnContinue.Enabled = true;
        }
        public static void DisableContinue()
        {
            StoresFormBuilder.btnContinue.Enabled = false;
        }
    }
}
