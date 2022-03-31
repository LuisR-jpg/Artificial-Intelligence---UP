using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlumniApp
{
    public class GraphicalInterface
    {
        protected InstitutionalUser user;
        public GraphicalInterface()
        {
            user = InstitutionalUser.LogIn();
        }
        public void Information()
        {
            
        }
        public void Grades()
        {

        }
    }
}
