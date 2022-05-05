using System;
using System.Collections.Generic;
using System.Text;

namespace MyOwnIterator
{
    class Day: Iterator
    {
        private List<Weekdays> weekdays;
        private int position;
        public Day(List<Weekdays> weekdays)
        {
            this.weekdays = weekdays;
            position = 0;
        }
        public override object Current
        {
            get
            {
                return weekdays[position];
            }
        }
        public override bool MoveNext()
        {
            position = Math.Min(position + 1, weekdays.Count);
            return position >= 0 && position < this.weekdays.Count;
        }
        public override void Reset()
        {
        }
    }
}
