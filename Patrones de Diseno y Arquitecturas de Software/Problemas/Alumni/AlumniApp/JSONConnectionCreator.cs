using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlumniApp
{
    class JSONConnectionCreator: ConnectionCreator
    {
        public override Connection CreateConnection()
        {
            return new JSONConnection();
        }
    }
}
