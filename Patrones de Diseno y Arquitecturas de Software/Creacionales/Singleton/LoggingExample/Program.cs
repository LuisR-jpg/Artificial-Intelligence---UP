using System;

namespace LoggingExample
{
	class MainClass
	{
		public static void Main (string[] args)
		{
            // get the logger instance
            Logger logger = Logger.Instance;

			// log three lines
			logger.Log (string.Format("Logging started at {0}", DateTime.Now));
			logger.Log ("Hello World!");
			logger.Log (string.Format("Logging ended at {0}", DateTime.Now));
		}
	}
}
