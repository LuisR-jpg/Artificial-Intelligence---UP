namespace SalesApp
{
    class TextBoxAdapter: AbstractAdapter
    {
        public override void Log(string operation)
        {
            Logger.GetInstance().textBox.Text += "\r\n" + operation;
        }
    }
}
