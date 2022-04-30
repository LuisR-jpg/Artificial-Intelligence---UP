using System.Windows.Forms;
using System.Drawing;
using System;

namespace SalesApp
{
    class RaiseOrderBuilder : Builder
    {
        public Store store;
        public override void CreateForm(int nTimes)
        {
            form = new Form();
            FormatForm(false);
            form.Size = new Size(350, 250);
            store = Logistics.GetInstance().GetCurrentStore();
        }
        public override void AddButtons()
        {
            int width = 100;
            Button btn = new Button
            {
                Text = "Raise Order",
                Size = new Size(width, 25),
                Location = new Point(215, 180)
            };
            btn.Click += NewOrderClick;
            form.Controls.Add(btn);
        }
        public override void AddOtherComponents()
        {
            Label lbl = new Label
            {
                Text = "Store " + store.GetID() + ". " + store.GetName(),
                Location = new Point(5, 5)
            };
            form.Controls.Add(lbl);
            string[] products = { "Sodas", "Frozen Vegetables", "Breads" };
            for (int i = 0, height = 50; i < products.Length; i++)
            {

                Label lblN = new Label
                {
                    Text = products[i],
                    Location = new Point(60, height * (i + 1)),
                    AutoSize = true
                };
                form.Controls.Add(lblN);
                int value = 0;
                switch (products[i])
                {
                    case "Sodas":
                        value = store.GetSodasQty();
                        break;
                    case "Frozen Vegetables":
                        value = store.GetVegetablesQty();
                        break;
                    case "Breads":
                        value = store.GetBreadsQty();
                        break;
                }
                NumericUpDown nUD = new NumericUpDown
                {
                    Size = new Size(50, 10),
                    Location = new Point(160, height * (i + 1)),
                    DecimalPlaces = 0,
                    Maximum = 100,
                    Increment = 1,
                    Minimum = 0,
                    Value = value,
                    Name = products[i]
                };
                nUD.ValueChanged += nUDChanged;
                form.Controls.Add(nUD);
            }
        }
        private void nUDChanged(object s, EventArgs e)
        {
            NumericUpDown nUD = s as NumericUpDown;
            int value = Decimal.ToInt32(nUD.Value);
            switch (nUD.Name)
            {
                case "Sodas":
                    store.SetSodasQty(value);
                    break;
                case "Breads":
                    store.SetBreadsQty(value);
                    break;
                case "Frozen Vegetables":
                    store.SetVegetablesQty(value);
                    break;
            }
            Console.WriteLine(value);
        }
        private void NewOrderClick(object s, EventArgs e)
        {
            form.Close();
        }
    }
}
