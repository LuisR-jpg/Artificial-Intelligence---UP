using System;
namespace ComputerSales {
    class Keyboard: Component {
        private string plug = "USB";
        private int []validPorts = {2};
        public Keyboard() {
            manufacturer = "HG";
            model = "K600";
            isInput = true;
            isOutput = false;
            price = 350f;
        }
        public override void describe() {
            base.information();
            Console.WriteLine ("Plug: {0}", this.plug);
            Console.WriteLine("Valid Ports:");
            foreach(int port in validPorts)
                Console.WriteLine("\tPort {0}", port);
        }
    }
}