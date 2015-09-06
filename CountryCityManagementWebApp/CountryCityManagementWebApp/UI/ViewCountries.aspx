<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCountries.aspx.cs" Inherits="CountryInfoWebApp.UI.ViewCountries" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Country Information</title>

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

            <div class="col-md-8 col-md-offset-2">
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
                                <li class="active"><a href="ViewCountries.aspx">View Country</a></li>
                                <li><a href="ViewCities.aspx">View City</a></li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <h3 class="text-center">Countries Information</h3>
                <hr class="colorgraph">
                <br>

                <div class="col-md-10 col-md-offset-1">

                    <div class="panel panel-info">
                        <div class="panel-heading">Search Criteria</div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Name</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="nameTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:LinkButton ID="searchlLinkButton" runat="server" CssClass="btn btn-info btn-pressure btn-sensitive col-sm-3" OnClick="searchlLinkButton_Click"><span class="btn-label"><i class="glyphicon glyphicon-search"></i></span>Search</asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="countryGridView" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" runat="server" AllowPaging="True"  PageSize="5" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" OnPageIndexChanging="countryGridView_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="SL NO">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country Name">
                                    <ItemTemplate>
                                        <%#Eval("CountryName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country About">
                                    <ItemTemplate>
                                        <%#Eval("CountryAbout") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No Of Cites">
                                    <ItemTemplate>
                                        <%#Eval("NoOfCites") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No Of City Dwellers">
                                    <ItemTemplate>
                                        <%#Eval("TotalNoOfDwellers")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
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
