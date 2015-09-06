using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityManagementWebApp.Model
{
    public class City
    {
        public int CityID { get; set; }
        public string Name { get; set; }
        public string About { get; set; }
        public int NoOfDewllers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public int CountryID { get; set; }

        public City(string name, string about, int noOfDewllers, string location, string weather, int countryId):this()
        {
            Name = name;
            About = about;
            NoOfDewllers = noOfDewllers;
            Location = location;
            Weather = weather;
            CountryID = countryId;
        }

        public City()
        {
        }
    }
}