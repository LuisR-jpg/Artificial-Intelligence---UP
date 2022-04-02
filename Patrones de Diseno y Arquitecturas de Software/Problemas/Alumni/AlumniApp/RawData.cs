using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace AlumniApp
{
    public class Data
    {
        public List<User> users { get; set; }
        public List<Subject> subjects { get; set; }
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
    public class compactSubject
    {
        public int subjectID;
        public int[] grades;
        public static compactSubject Cast(Object o)
        {
            return JsonConvert.DeserializeObject<compactSubject>(o.ToString());
        }
    }
}
