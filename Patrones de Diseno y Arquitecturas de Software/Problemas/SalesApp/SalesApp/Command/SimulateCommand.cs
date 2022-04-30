using System.Windows.Forms;

namespace SalesApp
{
    class SimulateCommand : Command
    {
        int tVegetables, tSodas, tBreads;
        Logistics logistics;
        public SimulateCommand(int tV, int tB, int tS)
        {
            tVegetables = tV;
            tSodas = tS;
            tBreads = tB;
            logistics = Logistics.GetInstance();
        }
        protected override void Run()
        {
            description = "Start Simulation";
            Log();
            bool r = logistics.Simulate(tVegetables, tBreads, tSodas);
            string message = logistics.GetSimulationMessage();
            MessageBoxButtons buttons;
            string caption;
            if (r)
            {
                message += "\n\nContinue?";
                buttons = MessageBoxButtons.YesNo;
                caption = "Simulation Succeeded";
                DialogResult result = MessageBox.Show(message, caption, buttons);
                if (result == DialogResult.Yes)
                {
                    SalesManager manager = new SalesManager(new ChoseRouteCommand());
                    manager.Execute();
                }
            }
            else
            {
                buttons = MessageBoxButtons.OK;
                caption = "Error Detected in Input";
                MessageBox.Show(message, caption, buttons);
            }
            description = message;
            Log();
            description = "End Simulation";
            Log();
        }
        protected override void SetDescription() { }
        protected override void Log() { }
    }
}
