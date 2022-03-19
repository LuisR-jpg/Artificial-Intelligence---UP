using System;
namespace ComputerSales {
    class PrinterMaker: Provider {
        private bool _isLaser;
        public Component build(bool isLaser) {
            _isLaser = isLaser;
            return build();
        }
        public override Component build() {
            return new Printer(_isLaser);
        }
    }
}