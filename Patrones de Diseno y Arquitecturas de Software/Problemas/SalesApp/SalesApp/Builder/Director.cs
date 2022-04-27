using System.Windows.Forms;

namespace SalesApp
{
    class FormsDirector
    {
        Builder builder;
        public void SetBuilder(Builder builder)
        {
            this.builder = builder;
        }
        public void Build()
        {
            builder.CreateForm();
            builder.AddButtons();
            builder.AddOtherComponents();
        }
    }
}
