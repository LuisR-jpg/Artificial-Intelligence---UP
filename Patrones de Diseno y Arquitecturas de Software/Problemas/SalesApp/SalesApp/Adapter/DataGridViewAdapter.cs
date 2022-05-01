namespace SalesApp
{
    class DataGridViewAdapter: AbstractAdapter
    { 
        public override void Log(string operation)
        {
            Logger.GetInstance().dataGridView.Rows.Add(operation);
        }
    }
}
