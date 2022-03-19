using System;
namespace ComputerSales {
    class TouchScreenMaker: Provider {
        public override Component build() {
            return new TouchScreen();
        }
    }
}