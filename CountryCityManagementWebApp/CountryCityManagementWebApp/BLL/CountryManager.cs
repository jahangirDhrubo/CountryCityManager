using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityManagementWebApp.DAL;
using CountryCityManagementWebApp.Model;

namespace CountryCityManagementWebApp.BLL
{
    public class CountryManager
    {
        CountryGateWay countryGateWay = new CountryGateWay();

        public List<Country> GetAllCountries()
        {
            return countryGateWay.GetAllCountries();
        }

        public string SaveCountry(Country country)
        {
           int length= country.About.Length;
            if (length > 7000)
            {
                return "Keep Your Text limit upto 3000.";
            }
            else
            {
                Country aCountry = countryGateWay.IsExist(country);
                if (aCountry == null)
                {
                    if (countryGateWay.SaveCountry(country) > 0)
                    {
                        return "Country Save Successfully.";
                    }
                    return "Failed to Save New Country";
                }
                return "Country already exist!!!!";
            }
        }

        public List<CountryWiseCity> GetCountryWiseCitiesByCountry(int countryID)
        {
            List < CountryWiseCity > countryWiseCities = countryGateWay.GetCountryWiseCitiesByCountry(countryID);
            CountryWiseCity countryWiseCity = new CountryWiseCity();
            foreach (CountryWiseCity cwc in countryWiseCities)
            {
                countryWiseCity.TotalNoOfDwellers += cwc.NoOfDewllers;
                countryWiseCity.CountryAbout = cwc.CountryAbout;
                countryWiseCity.CountryName = cwc.CountryName;
            }
            countryWiseCity.NoOfCites = countryWiseCities.Count;

            countryWiseCities.Clear();
            countryWiseCities.Add(countryWiseCity);

            return countryWiseCities;
        }

        public List<CountryWiseCity> GetCountryWiseCitiesByCountry()
        {
            List<CountryWiseCity> countryWiseCities = countryGateWay.GetCountryWiseCitiesByCountry();
            List<CountryWiseCity> allCountryWiseCities = new List<CountryWiseCity>();
           

            foreach (CountryWiseCity cwc in countryWiseCities)
            {
                CountryWiseCity countryWiseCity = new CountryWiseCity();
                var item = allCountryWiseCities.Find(x => x.CountryName == cwc.CountryName);
                if (item == null)
                {
                    countryWiseCity.CountryAbout = cwc.CountryAbout;
                    countryWiseCity.CountryName = cwc.CountryName;
                    countryWiseCity.TotalNoOfDwellers += cwc.NoOfDewllers;
                    countryWiseCity.NoOfCites = 1;
                    allCountryWiseCities.Add(countryWiseCity);
                }
                else
                {
                    item.TotalNoOfDwellers += cwc.NoOfDewllers;
                    item.NoOfCites ++;
                }
  
            }

            return allCountryWiseCities;
        }

        public Country GetCountryByID(Country country)
        {
            return countryGateWay.IsExist(country);
        }
    }
}