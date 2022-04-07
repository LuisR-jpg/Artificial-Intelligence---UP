using System;
using System.IO;

namespace LoggingExample
{
	/// <summary>
	/// The logger singleton class
	/// </summary>
	class Logger
	{
		#region Class fields

		// this field holds the logger instance
		private static Logger _instance = null;

		// this field holds the log file stream
		private Stream logStream = null;

		// this field holds the stream writer
		private StreamWriter streamWriter = null;

		// this field holds the lock handle for thread locking
		private static object _handle = new object ();

		#endregion

		/// <summary>
		/// Initializes a new instance of the <see cref="SingletonPattern.Logger"/> class.
		/// </summary>
		/// <remarks>Note that the constructor is protected which makes it inaccessible to clients.</remarks>
		protected Logger()
		{
			logStream = File.Open ("logfile.log", FileMode.Create);
			streamWriter = new StreamWriter (logStream);
		}

		/// <summary>
		/// Log the specified message.
		/// </summary>
		/// <param name="message">The message to log.</param>
		public void Log(string message)
		{
			streamWriter.Write (message);
			streamWriter.Write (Environment.NewLine);
		}

		/// <summary>
		/// Releases unmanaged resources and performs other cleanup operations before the
		/// <see cref="SingletonPattern.Logger"/> is reclaimed by garbage collection.
		/// </summary>
		~Logger()
		{
			try 
			{
				streamWriter.Close ();
				streamWriter.Dispose ();
			}
			catch (Exception)
			{
			}
		}

		/// <summary>
		/// Gets the logger instance.
		/// </summary>
		/// <value>The instance of the logger.</value>
		public static Logger Instance
		{
			get
			{
				// thread-safe lazy initialization
				// remove this lock statement if your code is not multi-threaded
				lock (_handle)
				{
					if (_instance == null)
					{
						_instance = new Logger ();
					}
				}

				return _instance;
			}
		}
	}
	
}
