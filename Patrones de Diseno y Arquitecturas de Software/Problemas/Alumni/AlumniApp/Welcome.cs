using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AlumniApp
{
    public partial class Welcome : Form
    {
        private InstitutionalUser iUser = null;
        public Welcome()
        {
            InitializeComponent();
        }

        private void buttonLogIn_Click(object sender, EventArgs e)
        {
            bool missingInfo = false, notMatchingInfo = false;
            missingInfo = (textName.Text == string.Empty || textPassword.Text == string.Empty);
            if (!missingInfo)
            {
                User user = Data.FindUser(textName.Text, textPassword.Text);
                if (user == null) notMatchingInfo = true;
                else createUser(user);
            }
            if (missingInfo || notMatchingInfo)
            {
                string eMessage, eCaption = "Failed to log in";
                MessageBoxButtons button = MessageBoxButtons.OK;
                DialogResult result;
                if (missingInfo) eMessage = "Please fill both fields.";
                else eMessage = "Please enter a valid user.";
                result = MessageBox.Show(eMessage, eCaption, button);
                textName.Text = textPassword.Text = string.Empty;
            }
        }
        private void createUser(User user)
        {
            switch (user.role)
            {
                case "student":
                    break;
                case "teacher":
                    break;
                case "supervisor":
                    break;
            }
        }
        public InstitutionalUser GetUser()
        {
            return iUser;
        }

    }
}
