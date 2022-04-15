namespace Calculator 
{
    public class Invoker
    {
        public float Invoke(Command command, int n, char o)
        {
            return command.Execute(n, o);
        }
    }
}