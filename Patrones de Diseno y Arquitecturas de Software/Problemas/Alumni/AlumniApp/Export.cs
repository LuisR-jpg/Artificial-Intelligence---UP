using Microsoft.Office.Interop;
using System.Reflection;
using System.IO;
using System.Configuration;
using System.Collections.Generic;
using System;

namespace AlumniApp
{
    public sealed class Export
    {
        private static Export instance;
        private readonly Output targetOutput;
        private Export()
        {
            OutputCreator creator;
            switch (ConfigurationManager.AppSettings["exportTo"])
            {
                default:
                case "PlainText":
                    creator = new PlainCreator();
                    break;
                case "WordDocument":
                    creator = new DocxCreator();
                    break;
            }
            targetOutput = creator.CreateTarget();
        }
        public static Export GetInstance()
        {
            if (instance == null)
                instance = new Export();
            return instance;
        }
        public bool Write(string name, List<string> txt)
        {
            return targetOutput.Write(name, txt);
        }
    }
    public class DocxCreator: OutputCreator
    {
        public override Output CreateTarget()
        {
            return new DocxOutput();
        }
    }
    public class PlainCreator : OutputCreator
    {
        public override Output CreateTarget()
        {
            return new PlainOutput();
        }
    }
    public class PlainOutput : Output
    {

        public override bool Write(string studentName, string text)
        {
            try
            {
                using (StreamWriter writer = new StreamWriter(GetFileName(studentName), false))
                {
                    writer.WriteLine(text);
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        public override string GetFileName(string name)
        {
            return base.GetFileName(name) + ".txt";
        }
    }
    public class DocxOutput: Output
    {
        public override bool Write(string studentName, string text)
        {
            try
            {
                Microsoft.Office.Interop.Word._Application app = new Microsoft.Office.Interop.Word.Application();
                Microsoft.Office.Interop.Word._Document doc = app.Documents.Open(GetFileName(studentName));
                object missing = System.Reflection.Missing.Value;
                app.Visible = true;
                doc.Content.Text = text;
                doc.Save();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public override string GetFileName(string name)
        {
            return base.GetFileName(name) + ".docx";
        }
    }
    public abstract class OutputCreator {
        public abstract Output CreateTarget();
    }
    public abstract class Output
    {
        public virtual string GetFileName(string name)
        {
            return "..\\..\\Grades" + name.Replace(" ", String.Empty);
        }
        public bool Write(string studentName, List<string> lines)
        {
            string txt = "";
            foreach (string line in lines)
                txt += line + "\n";
            return Write(studentName, txt);
        }
        public abstract bool Write(string studentName, string text);
    }
}
