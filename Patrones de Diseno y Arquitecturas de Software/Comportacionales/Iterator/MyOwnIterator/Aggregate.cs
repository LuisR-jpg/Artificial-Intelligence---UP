using System;
using System.Collections;
using System.Text;

namespace MyOwnIterator
{
    abstract class Aggregate: IEnumerable
    {
        public abstract IEnumerator GetEnumerator();
    }
}
