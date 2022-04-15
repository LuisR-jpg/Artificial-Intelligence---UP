namespace Calculator 
{
    public abstract class Command 
    {
        protected Receiver receiver;
        public Command(Receiver receiver) 
        {
            this.receiver = receiver;
        }
        public abstract float Execute(float number, char o);
    }
}