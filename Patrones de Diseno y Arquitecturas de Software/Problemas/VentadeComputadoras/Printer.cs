using System;
namespace ComputerSales {
    class Printer: Component {
        private int []validPorts = {6};
        private string type;
        public Printer(bool isLaser) {
            manufacturer = "Canon";
            model = "DeskJet 2030";
            isInput = false;
            isOutput = true;
            price = 15000f;
            if(isLaser) type = "Laser";
            else type = "Deskjet";
        }
        public override void describe() {
            base.information();
            Console.WriteLine("{0} printer", type);
            Console.WriteLine("Valid Ports:");
            foreach(int port in validPorts)
                Console.WriteLine("\tPort {0}", port);
        }
    }
}