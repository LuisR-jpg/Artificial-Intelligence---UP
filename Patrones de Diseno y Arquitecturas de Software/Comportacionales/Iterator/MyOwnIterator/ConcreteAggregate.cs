using System;
using System.Collections;
using System.Text;

namespace MyOwnIterator
{
    class Weekdays: Aggregate //Weekdays
    {
        public string Name { get; set; }
        public override IEnumerator GetEnumerator()
        {
            throw new NotImplementedException();
        }
    }
}
