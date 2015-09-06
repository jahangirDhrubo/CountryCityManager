using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityManagementWebApp.BLL;
using CountryCityManagementWebApp.Model;

namespace CountryInfoWebApp.UI
{
    public partial class CountryEntry : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
           LoadData();
        }

        protected void saveLinkButton_Click(object sender, EventArgs e)
        {
            Country country = new Country(aboutTextBox.Text, nameTextBox.Text);
            string status = countryManager.SaveCountry(country);

            outLabel.ForeColor = status == "Country Save Successfully." ? Color.Green : Color.Red;
            
            outLabel.Text = status;

            LoadData();
        }

        protected void cancelLinkButton_Click(object sender, EventArgs e)
        {
            nameTextBox.Text = String.Empty;
            aboutTextBox.Text = String.Empty;
        }

        private void LoadData()
        {
            countryGridView.DataSource = countryManager.GetAllCountries();
            countryGridView.DataBind();
        }

        protected void countryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryGridView.PageIndex = e.NewPageIndex;
            LoadData();
        }

    }
}