<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityEntry.aspx.cs" Inherits="CountryInfoWebApp.UI.CityEntry" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>City Entry</title>

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
                                <li class="active"><a href="CityEntry.aspx">City Entry</a></li>
                                <li><a href="ViewCountries.aspx">View Country</a></li>
                                <li><a href="ViewCities.aspx">View City</a></li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <h3 class="text-center">City Entry</h3>
                <hr class="colorgraph">
                <br>

                <div class="col-md-10 col-md-offset-1">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="nameTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                          <div class="form-group">
                            <label class="col-sm-3 control-label">About</label>
                            <div class="col-sm-9">
                                <asp:ScriptManager runat="server"></asp:ScriptManager>
                                <asp:TextBox ID="aboutTextBox" TextMode="MultiLine" Rows="3" CssClass="form-control" Height="350" runat="server"></asp:TextBox>
                                <ajaxToolkit:HtmlEditorExtender ID="aboutTextBox_HtmlEditorExtender" runat="server" TargetControlID="aboutTextBox">
                                </ajaxToolkit:HtmlEditorExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">No. of dwellers</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="noOfDwellersTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Location</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="locationTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Weather</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="weatherTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Country</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="countryDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <asp:LinkButton ID="saveLinkButton" runat="server" CssClass="btn btn-info btn-pressure btn-sensitive col-md-4 col-md-offset-1" OnClick="saveLinkButton_Click"><span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>Save</asp:LinkButton>
                                <asp:LinkButton ID="cancelLinkButton" runat="server" CssClass="btn btn-info btn-pressure btn-sensitive col-md-4 col-md-offset-2" OnClick="cancelLinkButton_Click"><span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Cancel</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <asp:Label ID="outLabel" runat="server"></asp:Label>
                    <div class="table-responsive">
                        <asp:GridView ID="cityGridView" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" runat="server" AllowPaging="True" OnPageIndexChanging="cityGridView_PageIndexChanging" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
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
                                <asp:TemplateField HeaderText="No OF Dewllers">
                                    <ItemTemplate>
                                        <%#Eval("NoOfDewllers") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country">
                                    <ItemTemplate>
                                        <%#Eval("CountryName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                No Data Found
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <ajaxToolkit:AnimationExtender ID="cityGridView_AnimationExtender" runat="server" BehaviorID="cityGridView_AnimationExtender" TargetControlID="cityGridView">
                        </ajaxToolkit:AnimationExtender>
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

