using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace IMCApp
{
    public partial class App : Application
    {
        public App ()
        {
            MainPage = new MainPage();
        }

        protected override void OnStart ()
        {
        }

        protected override void OnSleep ()
        {
        }

        protected override void OnResume ()
        {
        }
    }
}
