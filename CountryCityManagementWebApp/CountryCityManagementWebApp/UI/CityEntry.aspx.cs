using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityManagementWebApp.BLL;
using CountryCityManagementWebApp.Model;

namespace CountryInfoWebApp.UI
{
    public partial class CityEntry : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        CityManager cityManager = new CityManager();
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

       private void LoadData()
       {
           cityGridView.DataSource = cityManager.GetAllCountryWiseCities();
           cityGridView.DataBind();
       }

       protected void saveLinkButton_Click(object sender, EventArgs e)
       {
           City city = new City(nameTextBox.Text,aboutTextBox.Text,Convert.ToInt32(noOfDwellersTextBox.Text),locationTextBox.Text,weatherTextBox.Text,Convert.ToInt32(countryDropDownList.SelectedValue));

           string status = cityManager.SaveCountry(city);
           if (status == "City Save Successfully.")
           {
               outLabel.ForeColor = Color.Green;
           }
           else
           {
               outLabel.ForeColor = Color.Red;
           }

           outLabel.Text = status;

           LoadData();
           
       }

       protected void cancelLinkButton_Click(object sender, EventArgs e)
       {
           nameTextBox.Text = String.Empty;
           aboutTextBox.Text = String.Empty;
           noOfDwellersTextBox.Text = String.Empty;
           locationTextBox.Text = String.Empty;
           weatherTextBox.Text = String.Empty;
       }

       protected void cityGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
       {
           cityGridView.PageIndex = e.NewPageIndex;
           LoadData();
       }
    }
}