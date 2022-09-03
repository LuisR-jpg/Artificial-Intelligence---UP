using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace Calculator
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            string operation = Convert.ToString(Operation.SelectedItem);
            if (!string.IsNullOrEmpty(One.Text) && !string.IsNullOrEmpty(Two.Text) && !string.IsNullOrEmpty(operation))
            {
                double a = Convert.ToDouble(One.Text);
                double b = Convert.ToDouble(Two.Text);
                double result = 0;
                switch (operation)
                {
                    case "+":
                        result = a + b;
                        break;
                    case "-":
                        result = a - b;
                        break;
                    case "//":
                        result = a / b;
                        break;
                    case "*":
                        result = a * b;
                        break;
                }
                DisplayAlert("Calculator", One.Text + " " + operation + " " + Two.Text + " = " + Convert.ToString(result), "Ok");
            }
            else
            {
                DisplayAlert("Wrong data",
                    "Please fill all the info", "Ok");
            }
        }
    }
}
