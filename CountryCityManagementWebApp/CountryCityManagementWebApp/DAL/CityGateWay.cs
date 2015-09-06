using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using CountryCityManagementWebApp.Model;

namespace CountryCityManagementWebApp.DAL
{
    public class CityGateWay
    {
        private string _connectionString =
            WebConfigurationManager.ConnectionStrings["CCMConnectionString"].ConnectionString;

        public List<City> GetAllCitys()
        {
            SqlConnection connection = new SqlConnection(_connectionString);

            string query = "SELECT * FROM City ORDER BY Name ASC";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            List<City> citys = new List<City>();
            while (reader.Read())
            {
                City city = new City();
                city.CityID = (int) reader["CityID"];
                city.Name = reader["Name"].ToString();
                city.About = HttpUtility.HtmlDecode(reader["About"].ToString());
                city.Location = reader["Location"].ToString();
                city.NoOfDewllers = (int) reader["NoOfDewllers"];
                city.Weather = reader["Weather"].ToString();
                city.CountryID =(int) reader["CountryID"];
                citys.Add(city);
            }
            reader.Close();
            connection.Close();
            return citys;
        }

        public int SaveCity(City city)
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = @"INSERT INTO City VALUES('" + city.Name + "','" + HttpUtility.HtmlEncode(city.About) + "','" + city.NoOfDewllers + "','" + city.Location + "','" + city.Weather + "'," + city.CountryID + ")";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();

            return rowAffected;
        }

        public bool IsExist(City city)
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = "SELECT * FROM City Where name='"+city.Name+"'";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
               reader.Close();
                connection.Close();
                return true;
            }
            reader.Close();
            connection.Close();
            return false;

        }

        public List<CityWiseCountry> GetAllCountryWiseCities()
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = "SELECT ci.Name As [City Name], ci.About AS [City About], ci.NoOfDwellers, ci.Location, ci.Weather, co.Name AS [Country Name], co.About As [Country About] FROM City ci INNER JOIN Country AS co ON co.CountryID = ci.CountryID ORDER BY ci.Name ASC";

            SqlCommand command = new SqlCommand(query,connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<CityWiseCountry> countryWiseCities = new List<CityWiseCountry>();;

            while (reader.Read())
            {
                CityWiseCountry cityWiseCountry = new CityWiseCountry();

                cityWiseCountry.CityAbout = HttpUtility.HtmlDecode(reader["City About"].ToString());
                cityWiseCountry.CityName = reader["City Name"].ToString();
                cityWiseCountry.CountryAbout = HttpUtility.HtmlDecode(reader["Country About"].ToString());
                cityWiseCountry.CountryName = reader["Country Name"].ToString();
                cityWiseCountry.Location = reader["Location"].ToString();
                cityWiseCountry.NoOfDewllers = (int) reader["NoofDwellers"];
                cityWiseCountry.Weather = reader["Weather"].ToString();

                countryWiseCities.Add(cityWiseCountry);
            }

            reader.Close();
            connection.Close();
            return countryWiseCities;
        }

        public List<CityWiseCountry> GetCountryWiseCitiesByCountry(int countryID)
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = "SELECT ci.Name As [City Name], ci.About AS [City About], ci.NoOfDwellers, ci.Location, ci.Weather, co.Name AS [Country Name], co.About As [Country About] FROM City ci INNER JOIN Country AS co ON co.CountryID = ci.CountryID WHERE co.CountryID ="+countryID+" ORDER BY ci.Name ASC";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<CityWiseCountry> countryWiseCities = new List<CityWiseCountry>(); ;

            while (reader.Read())
            {
                CityWiseCountry cityWiseCountry = new CityWiseCountry();

                cityWiseCountry.CityAbout = HttpUtility.HtmlDecode(reader["City About"].ToString());
                cityWiseCountry.CityName = reader["City Name"].ToString();
                cityWiseCountry.CountryAbout = HttpUtility.HtmlDecode(reader["Country About"].ToString());
                cityWiseCountry.CountryName = reader["Country Name"].ToString();
                cityWiseCountry.Location = reader["Location"].ToString();
                cityWiseCountry.NoOfDewllers = (int)reader["NoofDwellers"];
                cityWiseCountry.Weather = reader["Weather"].ToString();

                countryWiseCities.Add(cityWiseCountry);
            }

            reader.Close();
            connection.Close();
            return countryWiseCities;
        }

        public List<CityWiseCountry> GetCountryWiseCitiesByCityName(City city)
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = "SELECT ci.Name As [City Name], ci.About AS [City About], ci.NoOfDwellers, ci.Location, ci.Weather, co.Name AS [Country Name], co.About As [Country About] FROM City ci INNER JOIN Country AS co ON co.CountryID = ci.CountryID WHERE ci.Name ='" + city.Name + "' ORDER BY ci.Name ASC";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<CityWiseCountry> countryWiseCities = new List<CityWiseCountry>(); ;

            while (reader.Read())
            {
                CityWiseCountry cityWiseCountry = new CityWiseCountry();

                cityWiseCountry.CityAbout = HttpUtility.HtmlDecode(reader["City About"].ToString());
                cityWiseCountry.CityName = reader["City Name"].ToString();
                cityWiseCountry.CountryAbout = HttpUtility.HtmlDecode(reader["Country About"].ToString());
                cityWiseCountry.CountryName = reader["Country Name"].ToString();
                cityWiseCountry.Location = reader["Location"].ToString();
                cityWiseCountry.NoOfDewllers = (int)reader["NoofDwellers"];
                cityWiseCountry.Weather = reader["Weather"].ToString();

                countryWiseCities.Add(cityWiseCountry);
            }

            reader.Close();
            connection.Close();
            return countryWiseCities;
        }
        
    }
}