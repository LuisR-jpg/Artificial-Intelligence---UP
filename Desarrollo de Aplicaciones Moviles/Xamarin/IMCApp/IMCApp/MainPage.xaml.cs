using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace IMCApp
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Height.Text) &&
                !string.IsNullOrEmpty(Weight.Text))
            {
                var altura = double.Parse(Height.Text);
                var peso = double.Parse(Weight.Text);
                var imc = peso / (altura * altura);
                IMC.Text = imc.ToString();
            }
            else
            {
                DisplayAlert("Wrong data",
                    "Please fill all the info", "Ok");
            }
        }
    }
}