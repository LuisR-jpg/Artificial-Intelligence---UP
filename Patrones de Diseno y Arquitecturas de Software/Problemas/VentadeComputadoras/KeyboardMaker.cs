using System;
namespace ComputerSales {
    class KeyboardMaker: Provider {
        public override Component build() {
            return new Keyboard();
        }
    }
}