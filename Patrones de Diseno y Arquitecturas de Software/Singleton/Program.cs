using System;

namespace Singleton
{
    class Program
    {
        static void Main(string[] args)
        {
            Logger logger = Logger.GetInstance();
            Console.WriteLine("Hello World!");
        }
    }
}
