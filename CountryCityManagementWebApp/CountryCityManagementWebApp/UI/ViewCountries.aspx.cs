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
    public partial class ViewCountries : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void searchlLinkButton_Click(object sender, EventArgs e)
        {
            Country country = new Country();
            country.Name = nameTextBox.Text;
            country = countryManager.GetCountryByID(country);

            countryGridView.DataSource = countryManager.GetCountryWiseCitiesByCountry(country.CountryID);
            countryGridView.DataBind();

        }

        void LoadData()
        {
            countryGridView.DataSource = countryManager.GetCountryWiseCitiesByCountry();
            countryGridView.DataBind();
        }

        protected void countryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryGridView.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}