using System;
namespace ComputerSales {
    class GraphicTabletMaker: Provider {
        public override Component build() {
            return new GraphicTablet();
        }
    }
}