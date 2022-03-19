using System;
namespace ComputerSales {
    class CentralUnitMaker: Provider {
        public override Component build() {
            return new CentralUnit();
        }
    }
}