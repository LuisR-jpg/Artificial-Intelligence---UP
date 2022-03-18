using System;
namespace ComputerSales {
    class BasicComputerMaker: Manufacture {
        public override Computer build() {
            return new BasicComputer();
        }
    }
}