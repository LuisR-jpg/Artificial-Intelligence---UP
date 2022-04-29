namespace SalesApp
{
    public class SalesManager
    {
        private Command command;
        public SalesManager()
        {
        }
        public void SetCommand(Command command)
        {
            this.command = command;
        }
        public void Execute()
        {
            if(command != null)
                command.Execute();
        }
    }
}
