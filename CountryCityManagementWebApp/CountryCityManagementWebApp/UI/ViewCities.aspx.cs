using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityManagementWebApp.BLL;
using CountryCityManagementWebApp.Model;

namespace CountryInfoWebApp.UI
{
    public partial class ViewCities : System.Web.UI.Page
    {
        CityManager cityManager = new CityManager();
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                countryDropDownList.DataTextField = "Name";
                countryDropDownList.DataValueField = "CountryID";
                countryDropDownList.DataSource = countryManager.GetAllCountries();
                countryDropDownList.DataBind();
            }
            LoadData();
        }

        protected void searchlLinkButton_Click(object sender, EventArgs e)
        {
            if (countryRadioButton.Checked)
            {
                cityGridView.DataSource = cityManager.GetCountryWiseCitiesByCountry(Convert.ToInt32(countryDropDownList.SelectedValue));
                cityGridView.DataBind(); 
            }
            else
            {
                City city = new City();
                city.Name = searchTextBox.Text;
                cityGridView.DataSource = cityManager.GetCountryWiseCitiesCityName(city);
                cityGridView.DataBind();
            }
            
        }

        void LoadData()
        {
            cityGridView.DataSource = cityManager.GetAllCountryWiseCities();
            cityGridView.DataBind();
        }


        protected void cityGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityGridView.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}