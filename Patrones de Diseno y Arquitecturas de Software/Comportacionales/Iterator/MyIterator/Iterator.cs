using System;
using System.Collections;
namespace MyIterator
{
    abstract class Iterator: IEnumerator
    {
        public object Current => throw new NotImplementedException();
        public abstract bool MoveNext();
        public abstract void Reset();
    }
    class Program
    {
    }
}