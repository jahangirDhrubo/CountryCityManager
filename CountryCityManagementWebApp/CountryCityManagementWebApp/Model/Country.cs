using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityManagementWebApp.Model
{
    public class Country
    {
        public int CountryID { get; set; }
        public string Name { get; set; }
        public string About { get; set; }

        public Country(string about, string name):this()
        {
            About = about;
            Name = name;
        }

        public Country()
        {
        }
    }

}