using System;
namespace ComputerSales {
    class ProComputerMaker: Manufacture {
        public override Computer build() {
            return new ProComputer();
        }
    }
}