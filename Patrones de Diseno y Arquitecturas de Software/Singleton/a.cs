using System;
using System.Collections.Generic;
using System.Text;

namespace Singleton
{
    class Logger
    {
        private static Logger _instance = null;

        protected Logger()
        {

        }

        public static Logger GetInstance()
        {
            if(_instance==null)
            {
                _instance = new Logger();
            }
            return _instance;
        }
    }
}