using System;
using System.Collections.Generic;

namespace SalesApp
{
    class FormsDirector
    {
        private Dictionary<Type, int> openedForms;
        private Type className;
        Builder builder;
        
        public FormsDirector()
        {
            openedForms = new Dictionary<Type, int>();
        }
        public void SetBuilder(Builder builder)
        {
            this.builder = builder;
            this.className = builder.GetType();

        }
        public void Build(bool count = true)
        {
            if (count)
            {
                if (!openedForms.ContainsKey(className))
                    openedForms.Add(className, 0);
                openedForms[className]++;
            }
            builder.CreateForm(openedForms[className]);
            builder.AddButtons();
            builder.AddOtherComponents();
        }
    }
}
