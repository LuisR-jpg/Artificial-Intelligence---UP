using System;
namespace ComputerSales {
    class Cellphone: Computer { 
        public Cellphone() {
            base.init();
        }
        public override void setMinSpecs() {
            Provider tsMaker = new TouchScreenMaker();
            Component touchScreen = tsMaker.build();
            _components.Add(touchScreen);
        }
    }
}