using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityManagementWebApp.Model
{
    public class CountryWiseCity
    {
        private string _countryAbout;
        public int NoOfDewllers { get; set; }
        public int TotalNoOfDwellers { get; set; }
        public int NoOfCites { get; set; }
        public string CountryName { get; set; }

        public string CountryAbout
        {
            get { return HttpUtility.HtmlDecode(_countryAbout); }
            set { _countryAbout = value; }
        }

        public CountryWiseCity(int noOfDewllers, string countryName, string countryAbout):this()
        {
            NoOfDewllers = noOfDewllers;
            CountryName = countryName;
            CountryAbout = countryAbout;
        }

        public CountryWiseCity()
        {
            TotalNoOfDwellers = 0;
            NoOfCites = 0;
        }

    }
}