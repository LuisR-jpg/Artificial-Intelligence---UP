using System;

namespace Calculator
{
    public class ConcreteCommand: Command
    {
        public ConcreteCommand(Receiver receiver): base(receiver)
        {
            Console.WriteLine("New command created");
        }
        public override float Execute(float number, char o) 
        {   
            receiver.SetNumber(number);
            float r = receiver.Operation();
            receiver.Seto(o);
            return r;
        }
    }
}