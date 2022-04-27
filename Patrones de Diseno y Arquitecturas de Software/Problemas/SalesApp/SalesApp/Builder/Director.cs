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
            if(!openedForms.ContainsKey(className))
                openedForms.Add(className, 0);
            openedForms[className]++;
        }
        public void Build()
        {
            builder.CreateForm(openedForms[className]);
            builder.AddButtons();
            builder.AddOtherComponents();
        }
    }
}
