using System;
namespace ComputerSales {
    class MouseMaker: Provider {
        public override Component build() {
            return new Mouse();
        }
    }
}