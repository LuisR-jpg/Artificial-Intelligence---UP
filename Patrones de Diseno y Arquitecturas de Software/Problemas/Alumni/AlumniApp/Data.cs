using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace AlumniApp
{
    public class Data
    {
        public List<User> users { get; set; }
        public List<Subject> subjects { get; set; }
        public static User FindUser(string name, string password)
        {
            DataConnection conn = DataConnection.GetInstance();
            Data data = conn.GetData();
            string userName = cleanString(name);
            User user = data.users.Find(x => cleanString(x.fullName) == userName);
            if (user == null) return null;
            string hashedPassword = ComputeSha256Hash(password);
            if (hashedPassword != user.password) return null;
            return user;
        }
        private static string cleanString(String s)
        {
            return s.Replace(" ", String.Empty).ToLower();
        }
        private static string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                    builder.Append(bytes[i].ToString("x2"));
                return builder.ToString();
            }
        }
    }

    public class User
    {
        public int id { get; set; }
        public string fullName { get; set; }
        public string password { get; set; }
        public string role { get; set; }
        public string birthYear { get; set; }
        public string birthCity { get; set; }
        public string career { get; set; }
        public List<Object> subjects { get; set; }

    }

    public class Subject
    {
        public int id { get; set; }
        public string name { get; set; }
        public int teacherID { get; set; }
        public List<int> studentsID { get; set; }
    }


}
