using System.Windows.Forms;

namespace SalesApp
{
    class RaiseOrderBuilder: Builder
    {
        public Store store;
        public override void CreateForm(int nTimes)
        {
            form = new Form();
            FormatForm(false);
        }
        public override void AddButtons()
        {
        }
        public override void AddOtherComponents()
        {
        }
    }
}
