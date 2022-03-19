using System;
namespace ComputerSales {
    class MonitorMaker: Provider {
        public override Component build() {
            return new Monitor();
        }
    }
}