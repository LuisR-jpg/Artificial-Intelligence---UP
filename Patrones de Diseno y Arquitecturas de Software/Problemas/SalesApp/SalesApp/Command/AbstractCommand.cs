namespace SalesApp
{
    public abstract class Command
    {
        protected string description;
        public void Execute()
        {
            Run();
            Log();
        }
        protected abstract void SetDescription();
        protected abstract void Run();
        protected virtual void Log()
        {
            //Log here
        }
    }
}
