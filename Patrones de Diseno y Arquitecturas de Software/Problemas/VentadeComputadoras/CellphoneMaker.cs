using System;
namespace ComputerSales {
    class CellphoneMaker: Manufacture {
        public override Computer build() {
            return new Cellphone();
        }
    }
}