using System;
namespace ComputerSales {
    class BasicComputer: Computer {
        public BasicComputer() {
            base.init();
        }
        public override void setMinSpecs() {
            Provider kbMaker = new KeyboardMaker();
            Provider monitonMaker = new MonitorMaker();
            Component keyboard = kbMaker.build();
            Component monitor = monitonMaker.build();
            _components.Add(keyboard);
            _components.Add(monitor);
        }
    }
}