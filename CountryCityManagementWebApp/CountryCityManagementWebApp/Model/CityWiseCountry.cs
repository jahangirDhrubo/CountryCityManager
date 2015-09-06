using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//Sazal Siddiqui NS
namespace CountryCityManagementWebApp.DAL
{
    public class CityWiseCountry
    {
        public string CityName { get; set; }
        public string CityAbout { get; set; }
        public int NoOfDewllers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public string CountryName { get; set; }
        public string CountryAbout { get; set; }

        public CityWiseCountry(string cityName, string cityAbout, int noOfDewllers, string location, string weather, string countryName, string countryAbout):this()
        {

            CityName = cityName;
            CityAbout = cityAbout;
            NoOfDewllers = noOfDewllers;
            Location = location;
            Weather = weather;
            CountryName = countryName;
            CountryAbout = countryAbout;
        }

        public CityWiseCountry()
        {
        }
    }
}