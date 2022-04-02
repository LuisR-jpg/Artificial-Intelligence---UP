using System;
using System.Windows.Forms;

namespace AlumniApp
{
    public partial class Welcome : Form
    {
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
                bool isUser = InstitutionalUser.ValidateUser(textName.Text, textPassword.Text);
                if (!isUser) notMatchingInfo = true;
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
            else this.Close();
        }
    }
}
