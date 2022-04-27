using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SalesApp
{
    public partial class Welcome : System.Windows.Forms.Form
    {
        Form formStores;
        public Welcome()
        {
            InitializeComponent();
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            formStores = GUI.CreateStoresForm();
            formStores.Controls.Find("btnContinue", false);
            formStores.ShowDialog();
        }

        private void btnLog_Click(object sender, EventArgs e)
        {

        }
    }
}
