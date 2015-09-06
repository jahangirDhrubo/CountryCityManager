using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityManagementWebApp.DAL;
using CountryCityManagementWebApp.Model;

namespace CountryCityManagementWebApp.BLL
{
    public class CityManager
    {
        CityGateWay cityGateWay = new CityGateWay();
        public string SaveCountry(City city)
        {
            int length = city.About.Length;
            if (length > 7000)
            {
                return "Keep Your Text limit upto 3000.";
            }
            if (!cityGateWay.IsExist(city))
            {
                if (cityGateWay.SaveCity(city)>0)
                {
                    return "City Save Successfully.";
                }
                return "Failed to Save New City";
            }
            return "City already exist!!!!";
        }

        public List<City> GetAllCitys()
        {
            return cityGateWay.GetAllCitys();
        }

        public List<CityWiseCountry> GetAllCountryWiseCities()
        {
            return cityGateWay.GetAllCountryWiseCities();
        }

        public List<CityWiseCountry> GetCountryWiseCitiesByCountry(int countryID)
        {
            return cityGateWay.GetCountryWiseCitiesByCountry(countryID);
        }

        public List<CityWiseCountry> GetCountryWiseCitiesCityName(City city)
        {
            return cityGateWay.GetCountryWiseCitiesByCityName(city);
        }
    }
}