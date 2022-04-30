using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class RouteCreatorBuilder : Builder
    {
        string[] trucks = { "Vegetables Truck", "Breads Truck", "Sodas Truck" };
        public override void CreateForm(int timesOpened)
        {
            form = new Form();
            FormatForm(false);
        }
        public override void AddButtons()
        {
            Button btnSimulate = new Button
            {
                Text = "Simulate",
                Location = new Point(sizeStandard.Width - 150, sizeStandard.Height - 100),
                Size = new Size(100, 30)
            };
            btnSimulate.Click += SimulateClick;
            form.Controls.Add(btnSimulate);
        }
        public override void AddOtherComponents()
        {
            Label lblTitle = new Label
            {
                Text = "The best route is:",
                Location = new Point(20, 20)
            };
            form.Controls.Add(lblTitle);
            int width = 305, height = 150;
            DataGridView dgv = new DataGridView
            {
                Size = new Size(width, height),
                Location = new Point(60, 100),
                ColumnCount = 3,
                ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single,
                CellBorderStyle = DataGridViewCellBorderStyle.Single,
                GridColor = Color.Black,
                RowHeadersVisible = false,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                MultiSelect = false,
                ReadOnly = true,
                AllowUserToResizeRows = false,
                AllowUserToAddRows = false,
                AllowUserToDeleteRows = false,
                AllowUserToResizeColumns = false,
                AllowUserToOrderColumns = false
            };
            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font(dgv.Font, FontStyle.Bold);
            dgv.Columns[0].Name = "ID";
            dgv.Columns[1].Name = "Store";
            dgv.Columns[2].Name = "Profit";
            foreach (DataGridViewColumn column in dgv.Columns)
                column.SortMode = DataGridViewColumnSortMode.NotSortable;
            form.Controls.Add(dgv);
            salesManager.SetCommand(new CreateRouteCommand());
            salesManager.Execute();
            foreach (Store s in Logistics.GetInstance().GetStores())
            {
                string id = s.GetID().ToString();
                string name = s.GetName();
                string revenue = s.GetRevenue().ToString();
                string[] row = { id, name, revenue };
                dgv.Rows.Add(row);
            }
            for (int i = 0, offset = 125, componentHeight = 50; i < trucks.Length; i++)
            {
                Label lblN = new Label
                {
                    Text = trucks[i],
                    Location = new Point(500, componentHeight * i + offset),
                    AutoSize = true
                };
                form.Controls.Add(lblN);
                NumericUpDown nUD = new NumericUpDown
                {
                    Size = new Size(50, 10),
                    Location = new Point(600, componentHeight * i + offset),
                    DecimalPlaces = 0,
                    Maximum = 100,
                    Increment = 1,
                    Minimum = 0,
                    Value = 0,
                    Name = trucks[i]
                };
                form.Controls.Add(nUD);
            }
        }
        private void SimulateClick(object s, EventArgs e)
        {
            int tVegetables = 0, tBreads = 0, tSodas = 0;
            foreach(string truck in trucks)
            {
                Control[] c = form.Controls.Find(truck, true);
                NumericUpDown n = c[0] as NumericUpDown;
                switch (truck)
                {
                    case "Vegetables Truck":
                        tVegetables += (int)n.Value;
                        break;
                    case "Breads Truck":
                        tBreads += (int)n.Value;
                        break;
                    case "Sodas Truck":
                        tSodas += (int)n.Value;
                        break;
                }
            }
            salesManager.SetCommand(new SimulateCommand(tVegetables, tBreads, tSodas));
            salesManager.Execute();
        }
    }
}
