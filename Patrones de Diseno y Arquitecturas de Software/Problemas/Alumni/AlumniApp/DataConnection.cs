using Newtonsoft.Json;
using System;
using System.IO;

namespace AlumniApp
{
    // EN : The Singleton should always be a 'sealed' class to prevent class
    // inheritance through external classes and also through nested classes.
    public sealed class DataConnection
    {
        private static DataConnection _instance;
        private readonly Connection sourceConnection;
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
            return sourceConnection.GetData();
        }
        public User FindUserByName(string name)
        {
            return sourceConnection.FindUserByName(name);
        }
        public User FindUserByID(int ID)
        {
            return sourceConnection.FindUserByID(ID);
        }
        public Subject FindSubjectByID(int ID)
        {
            return sourceConnection.FindSubjectByID(ID);
        }
        public int[] FindGradesByUserAndSubject(int userID, int subjectID)
        {
            return sourceConnection.FindGradesByUserAndSubject(userID, subjectID);
        }
        public static string cleanString(String s)
        {
            return s.Replace(" ", String.Empty).ToLower();
        }
    }
    class JSONConnection : Connection
    {
        private readonly string fileSource = "..\\..\\gitAllow.json";
        StreamReader r;
        private Data data = null;
        public JSONConnection()
        {
            Connect();
            GetData();
        }
        protected override void Connect()
        {
            r = new StreamReader(fileSource);
        }
        public override Data GetData()
        {
            if (data == null)
                using (r)
                {
                    string json = r.ReadToEnd();
                    data = JsonConvert.DeserializeObject<Data>(json);
                    return data;
                }
            return data;
        }
        public override User FindUserByName(string name)
        {
            string userName = DataConnection.cleanString(name);
            return data.users.Find(x => DataConnection.cleanString(x.fullName) == userName);
        }
        public override User FindUserByID(int ID)
        {
            return data.users.Find(x => x.id == ID);
        }
        public override Subject FindSubjectByID(int ID)
        {
            return data.subjects.Find(x => x.id == ID);
        }
        public override int[] FindGradesByUserAndSubject(int userID, int subjectID)
        {
            User u = FindUserByID(userID);
            Object s = u.subjects.Find(x => compactSubject.Cast(x).subjectID == subjectID);
            if (s == null) return null;
            return compactSubject.Cast(s).grades;
        }
    }
    abstract class Connection
    {
        protected abstract void Connect();
        public abstract Data GetData();
        public abstract User FindUserByName(string name);
        public abstract User FindUserByID(int ID);
        public abstract Subject FindSubjectByID(int ID);
        public abstract int[] FindGradesByUserAndSubject(int userID, int subjectID);
    }
    abstract class ConnectionCreator
    {
        public abstract Connection CreateConnection();
    }
    class JSONConnectionCreator : ConnectionCreator
    {
        public override Connection CreateConnection()
        {
            return new JSONConnection();
        }
    }
}
