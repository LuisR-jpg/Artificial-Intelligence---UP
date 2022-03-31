using Newtonsoft.Json;
using System.IO;

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
    abstract class ConnectionCreator
    {
        public abstract Connection CreateConnection();
    }
    abstract class Connection
    {
        protected abstract void Connect();

        public abstract Data GetData();
    }
    class JSONConnection : Connection
    {
        private readonly string fileSource = "..\\..\\gitAllow.json";
        StreamReader r;
        public JSONConnection()
        {
            Connect();
        }
        protected override void Connect()
        {
            r = new StreamReader(fileSource);
        }
        public override Data GetData()
        {
            using (r)
            {
                string json = r.ReadToEnd();
                Data data = JsonConvert.DeserializeObject<Data>(json);
                return data;
            }
        }
    }
    class JSONConnectionCreator : ConnectionCreator
    {
        public override Connection CreateConnection()
        {
            return new JSONConnection();
        }
    }
}
