using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlumniApp
{
    class JSONConnection: Connection
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
            using(r)
            {
                string json = r.ReadToEnd();
                Data data = JsonConvert.DeserializeObject<Data>(json);
                return data;
            }
        }
    }
}
