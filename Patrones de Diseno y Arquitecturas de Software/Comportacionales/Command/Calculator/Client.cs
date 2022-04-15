using System;
namespace Calculator
{
    public class Client
    {
        public void Run() 
        {
            Receiver receiver = new Receiver();
            Command command = new ConcreteCommand(receiver);
            Invoker invoker = new Invoker();
            int a;
            char o;
            a = 5;
            o = '+';
            Console.WriteLine(invoker.Invoke(command, a, o));
            a = 5;
            o = '-';
            Console.WriteLine(invoker.Invoke(command, a, o));
            a = 3;
            o = '*';
            Console.WriteLine(invoker.Invoke(command, a, o));
            a = 3;
            o = '/';
            Console.WriteLine(invoker.Invoke(command, a, o));
            a = 1;
            o = '=';
            Console.WriteLine(invoker.Invoke(command, a, o));
        }
    }
}