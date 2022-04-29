using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesApp
{
    abstract class AbstractCommand
    {

        public void Execute()
        {
            Run();
            Log();
        }
        protected abstract void Run();
        protected void Log()
        {
            //Log here
        }
    }
}
