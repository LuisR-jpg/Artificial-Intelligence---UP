using System.IO;

namespace SalesApp
{
    class TxtAdapter: AbstractAdapter
    {
        public override void Log(string operation)
        {
            try
            {
                using (StreamWriter writer = File.AppendText(Logger.GetInstance().filename))
                {
                    writer.WriteLine(operation);
                }
            }
            catch { }
        }
    }
}
