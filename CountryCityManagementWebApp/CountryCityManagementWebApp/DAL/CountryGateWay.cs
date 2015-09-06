using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using CountryCityManagementWebApp.Model;

namespace CountryCityManagementWebApp.DAL
{
    public class CountryGateWay
    {
        private string _connectionString =
            WebConfigurationManager.ConnectionStrings["CCMConnectionString"].ConnectionString;

        public List<Country> GetAllCountries()
        {
            SqlConnection connection = new SqlConnection(_connectionString);

            string query = "SELECT * FROM Country ORDER BY Name ASC";

            SqlCommand command = new SqlCommand(query,connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            List<Country> countries = new List<Country>();
            while (reader.Read())
            {
                Country country = new Country();
                country.CountryID = (int) reader["CountryID"];
                country.Name = reader["Name"].ToString();
                country.About = HttpUtility.HtmlDecode(reader["About"].ToString());
                countries.Add(country);
            }
            reader.Close();
            connection.Close();
            return countries;
        }

        public int SaveCountry(Country country)
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = @"INSERT INTO Country VALUES('"+country.Name+"','"+HttpUtility.HtmlEncode(country.About)+"')";
            SqlCommand command = new SqlCommand(query,connection);

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();

            return rowAffected;
        }

        public Country IsExist(Country country)
        {
            SqlConnection connection = new SqlConnection(_connectionString);

            string query = "SELECT * FROM Country WHERE Name='" + country.Name + "'";

            SqlCommand command = new SqlCommand(query,connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            Country aCountry = null;
            if (reader.HasRows)
            {
                reader.Read();
                aCountry = new Country();
                aCountry.CountryID = (int) reader["CountryID"];
                aCountry.Name = reader["Name"].ToString();
                aCountry.About = reader["About"].ToString();

                reader.Close();
                connection.Close();
            }

            return aCountry;
        }

        public List<CountryWiseCity> GetCountryWiseCitiesByCountry(int countryID)
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = "SELECT ci.NoOfDwellers, co.Name AS [Country Name], co.About As [Country About] FROM City ci INNER JOIN Country AS co ON co.CountryID = ci.CountryID WHERE co.CountryID =" + countryID + " ORDER BY ci.Name ASC";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<CountryWiseCity> countryWiseCitys = new List<CountryWiseCity>(); ;

            while (reader.Read())
            {
                CountryWiseCity countryWiseCity = new CountryWiseCity();

                countryWiseCity.CountryAbout = HttpUtility.HtmlDecode(reader["Country About"].ToString());
                countryWiseCity.CountryName = reader["Country Name"].ToString();
                countryWiseCity.NoOfDewllers = (int)reader["NoofDwellers"];

                countryWiseCitys.Add(countryWiseCity);
            }

            reader.Close();
            connection.Close();
            return countryWiseCitys;
        }

        public List<CountryWiseCity> GetCountryWiseCitiesByCountry()
        {
            SqlConnection connection = new SqlConnection(_connectionString);
            string query = "SELECT ci.NoOfDwellers, co.Name AS [Country Name], co.About As [Country About] FROM City ci  JOIN Country AS co ON co.CountryID = ci.CountryID ORDER BY co.Name ASC";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<CountryWiseCity> countryWiseCitys = new List<CountryWiseCity>(); ;

            while (reader.Read())
            {
                CountryWiseCity countryWiseCity = new CountryWiseCity();

                countryWiseCity.CountryAbout = HttpUtility.HtmlDecode(reader["Country About"].ToString());
                countryWiseCity.CountryName = reader["Country Name"].ToString();
                countryWiseCity.NoOfDewllers = (int)reader["NoofDwellers"];

                countryWiseCitys.Add(countryWiseCity);
            }

            reader.Close();
            connection.Close();
            return countryWiseCitys;
        }
    }

}