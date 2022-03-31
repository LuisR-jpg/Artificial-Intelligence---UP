using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlumniApp
{
    // EN : The Singleton should always be a 'sealed' class to prevent class
    // inheritance through external classes and also through nested classes.
    public sealed class DataConnection
    {
        private static DataConnection _instance;
        private readonly Connection sourceConnection;
        private Data data = null;
        private DataConnection()
        {
            ConnectionCreator jsonCreator = new JSONConnectionCreator();
            sourceConnection = jsonCreator.CreateConnection();
        }
        public static DataConnection GetInstance()
        {
            if (_instance == null)
                _instance = new DataConnection();
            return _instance;
        }
        public Data GetData()
        {
            if(data == null) 
                data = sourceConnection.GetData();
            return data;
        }
    }
}
