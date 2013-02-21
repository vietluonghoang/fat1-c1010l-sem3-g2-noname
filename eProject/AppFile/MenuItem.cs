using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject.AppFile
{
    public class MenuItem
    {
        private string _url;

        public string Url
        {
            get { return _url; }
            set { _url = value; }
        }

        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public MenuItem(string name, string url)
        {
            this.Name = name;
            this.Url = url;

        }

    }
}