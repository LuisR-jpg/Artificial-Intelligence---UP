using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesApp
{
    public sealed class Logger
    {
        private static Logger logger;
        private readonly string[] targetNames;
        public int[] targetsQty;
        public DataGridView dataGridView;
        public Label label;
        public TextBox textBox;
        public readonly string filename;
        private Logger()
        {
            targetNames = new string[] { "Text File", "Grid", "Text Box" };
            filename = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\LogFile.txt";
            targetsQty = new int[targetNames.Length];
            dataGridView = new DataGridView
            {
                Size = new Size(300, 300),
                Location = new Point(50, 45),
                ColumnCount = 1,
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
                AllowUserToOrderColumns = false,
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells
            };
            dataGridView.ColumnHeadersDefaultCellStyle.BackColor = Color.White;
            dataGridView.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dataGridView.ColumnHeadersDefaultCellStyle.Font = new Font(dataGridView.Font, FontStyle.Bold);
            dataGridView.Columns[0].Name = "Operations";
            foreach (DataGridViewColumn column in dataGridView.Columns)
                column.SortMode = DataGridViewColumnSortMode.NotSortable;

            label = new Label
            {
                Text = "Find your txt file in your Desktop Folder!",
                AutoSize = true,
                Location = new Point(300, 375)
            };

            textBox = new TextBox
            {
                Location = new Point(400, 45),
                Size = new Size(300, 300),
                Multiline = true,
                ReadOnly = true,
                Text = "\tOperations",
                ScrollBars = ScrollBars.Both
            };
        }
        public static Logger GetInstance()
        {
            if (logger == null)
                logger = new Logger();
            return logger;
        }
        public string[] GetTargetNames()
        {
            return targetNames;
        }
    }
}
