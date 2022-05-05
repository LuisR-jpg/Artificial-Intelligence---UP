using System;
using System.Collections;
namespace MyOwnIterator
{
    abstract class Iterator : IEnumerator
    {
        public abstract object Current { get; }
        public abstract bool MoveNext();
        public abstract void Reset();
    }
}