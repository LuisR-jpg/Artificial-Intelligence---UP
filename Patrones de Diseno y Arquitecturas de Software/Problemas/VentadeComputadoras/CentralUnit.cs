using System;
namespace ComputerSales {
    class CentralUnit: Component {
        public CentralUnit() {
            manufacturer = "Intel";
            model = "i7";
            isInput = false;
            isOutput = false;
            price = 10000f;
        }
        public override void describe() {
            base.information();
        }
    }
}