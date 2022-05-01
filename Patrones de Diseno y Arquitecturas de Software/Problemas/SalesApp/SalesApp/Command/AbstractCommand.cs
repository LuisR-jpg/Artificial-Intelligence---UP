namespace SalesApp
{
    public abstract class Command
    {
        protected string description;
        public void Execute()
        {
            SetDescription();
            Run();
            Log();
        }
        protected abstract void SetDescription();
        protected abstract void Run();
        protected virtual void Log()
        {
            Logger l = Logger.GetInstance();
            AbstractAdapter adapter;
            adapter = new TxtAdapter();
            for (int i = 0; i < l.targetsQty[0]; i++)
                adapter.Log(description);
            adapter = new DataGridViewAdapter();
            for (int i = 0; i < l.targetsQty[1]; i++)
                adapter.Log(description);
            adapter = new TextBoxAdapter();
            for (int i = 0; i < l.targetsQty[2]; i++)
                adapter.Log(description);
        }
    }
}
