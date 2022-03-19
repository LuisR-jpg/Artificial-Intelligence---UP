using System;
namespace ComputerSales {
    class GraphicTablet: Component {
        private string plug = "Serial";
        private int []validPorts = {0, 4};
        public GraphicTablet() {
            manufacturer = "Lenovo";
            model = "S731-A";
            isInput = true;
            isOutput = false;
            price = 3500f;
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