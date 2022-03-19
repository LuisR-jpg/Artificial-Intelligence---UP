using System;
namespace ComputerSales {
    class Monitor: Component {
        private int []validPorts = {5};
        public Monitor() {
            manufacturer = "Dell";
            model = "Monitowow";
            isInput = false;
            isOutput = true;
            price = 2050f;
        }
        public override void describe() {
            base.information();
            Console.WriteLine("Valid Ports:");
            foreach(int port in validPorts)
                Console.WriteLine("\tPort {0}", port);
        }
    }
}