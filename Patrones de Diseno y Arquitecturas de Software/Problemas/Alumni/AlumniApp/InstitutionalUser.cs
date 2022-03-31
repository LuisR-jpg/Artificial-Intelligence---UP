using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AlumniApp
{
    public abstract class InstitutionalUser
    {
        public static InstitutionalUser LogIn()
        {
            Form logIn = new Welcome();
            Application.Run(logIn);
            return null;
        }

    }
}
