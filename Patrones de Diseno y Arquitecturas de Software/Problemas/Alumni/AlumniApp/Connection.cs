using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlumniApp
{
    abstract class Connection
    {
        protected abstract void Connect();

        public abstract Data GetData();
    }
}
