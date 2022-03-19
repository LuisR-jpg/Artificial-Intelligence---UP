using System;
namespace ComputerSales {
    class TouchScreen: Component {
        public TouchScreen() {
            manufacturer = "Xiaomi";
            model = "Flat 3000";
            isInput = true;
            isOutput = true;
            price = 5000f;
        }
        public override void describe() {
            base.information();
        }
    }
}