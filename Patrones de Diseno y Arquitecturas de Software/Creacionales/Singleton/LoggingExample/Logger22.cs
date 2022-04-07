using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LoggingExample
{
    class Logger22
    {
        private static Logger22 _instance=null;

        protected Logger22()
        {

        }

        public static Logger22 GetInstance()
        {
            if(_instance==null)
            {
                _instance = new Logger22();
            }
            return _instance;
        }


    }
}
