<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCities.aspx.cs" Inherits="CountryInfoWebApp.UI.ViewCities" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>City Information</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-12">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li><a href="CountryEntry.aspx">Country Entry</a></li>
                                <li><a href="CityEntry.aspx">City Entry</a></li>
                                <li><a href="ViewCountries.aspx">View Country</a></li>
                                <li class="active"><a href="ViewCities.aspx">View City</a></li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <h3 class="text-center">Cities Information</h3>
                <hr class="colorgraph">
                <br>

                <div class="col-md-10 col-md-offset-1">

                    <div class="panel panel-info">
                        <div class="panel-heading">Search Criteria</div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-3">
                                        <div class="radio">
                                            <label>
                                                <asp:RadioButton ID="cityNameRadioButton" GroupName="search" runat="server" />City Name 
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="searchTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-3">
                                        <div class="radio">
                                            <label>
                                                <asp:RadioButton ID="countryRadioButton" GroupName="search" runat="server" Checked="True" />Country 
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                        <asp:DropDownList ID="countryDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-7">
                                        <asp:LinkButton ID="searchlLinkButton" runat="server" CssClass="btn btn-info btn-pressure btn-sensitive col-md-5" OnClick="searchlLinkButton_Click"><span class="btn-label"><i class="glyphicon glyphicon-search"></i></span>Search</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="cityGridView" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" runat="server" AllowPaging="True" PageSize="5" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnPageIndexChanging="cityGridView_PageIndexChanging">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField HeaderText="SL NO">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City Name">
                                    <ItemTemplate>
                                        <%#Eval("CityName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City About" >
                                    <ItemTemplate>
                                        <%#Eval("CityAbout") %>
                                    </ItemTemplate>
                                    <ItemStyle Width="350px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No Of Dwellers">
                                    <ItemTemplate>
                                        <%#Eval("NoOfDewllers") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <%#Eval("Location") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Weather">
                                    <ItemTemplate>
                                        <%#Eval("Weather") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country Name">
                                    <ItemTemplate>
                                        <%#Eval("CountryName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Country About">
                                    <ItemTemplate>
                                        <%#Eval("CountryAbout") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                No City Found
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
