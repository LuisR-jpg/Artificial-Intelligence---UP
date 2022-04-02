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
            bool missingInfo, notMatchingInfo = false;
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
                if (missingInfo) eMessage = "Please fill both fields.";
                else eMessage = "Please enter a valid user.";
                MessageBox.Show(eMessage, eCaption, button);
                textPassword.Text = string.Empty;
                textName.Focus();
            }
            else this.Hide();
        }

        private void OnClosing(object sender, FormClosingEventArgs e)
        {
            if(e.CloseReason == CloseReason.UserClosing)
                System.Environment.Exit(1);
        }
    }
}
