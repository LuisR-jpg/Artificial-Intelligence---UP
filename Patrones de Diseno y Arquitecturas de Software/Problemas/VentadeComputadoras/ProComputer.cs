using System;
namespace ComputerSales { 
    class ProComputer: Computer {
        public ProComputer() {
            base.init();
        }
        public override void setMinSpecs() {
            Provider gtMaker = new GraphicTabletMaker();
            Provider kbMaker = new KeyboardMaker();
            Provider monitonMaker = new MonitorMaker();
            Provider mouseMaker = new MouseMaker();
            Provider printerMaker = new PrinterMaker();
            Component graphicTablet = gtMaker.build();
            Component keyboard = kbMaker.build();
            Component monitor = monitonMaker.build();
            Component mouse = mouseMaker.build();
            Component printer = printerMaker.build();
            _components.Add(graphicTablet);
            _components.Add(keyboard);
            _components.Add(monitor);
            _components.Add(mouse);
            _components.Add(printer);
        }
    }
}