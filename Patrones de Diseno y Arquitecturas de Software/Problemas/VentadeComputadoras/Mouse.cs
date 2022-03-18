using System;
namespace ComputerSales {
    class Mouse: Component {
        private string plug = "USB";
        private int []validPorts = {1};
        public Mouse() {
            manufacturer = "Logitech";
            model = "G300";
            isInput = true;
            isOutput = false;
            price = 200f;
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