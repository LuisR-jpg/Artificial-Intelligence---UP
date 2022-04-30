using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    class RouteCreatorBuilder: Builder
    {
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
                Location = new Point(GetHorizontalCenter(width), 50),
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
        }
    }
}
