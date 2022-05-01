using System.Windows.Forms;

namespace SalesApp
{
    class LogBuilder: Builder
    {
        Logger logger;
        public override void CreateForm(int timesOpened)
        {
            form = new Form();
            FormatForm(true);
            logger = Logger.GetInstance();
        }
        public override void AddButtons() { }
        public override void AddOtherComponents()
        {
            if (logger.targetsQty[0] > 0) form.Controls.Add(logger.label);
            if (logger.targetsQty[1] > 0) form.Controls.Add(logger.dataGridView);
            if (logger.targetsQty[2] > 0) form.Controls.Add(logger.textBox);
        }
    }
}
