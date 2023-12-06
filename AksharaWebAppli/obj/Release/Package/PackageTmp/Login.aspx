<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AksharaWebAppli.Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <div class="container">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#admin">Admin Login</a></li>
                                <li><a data-toggle="tab" href="#employ">Employee Login</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="admin" class="tab-pane fade in active">
                                    <h3 class="text-center">Admin Login</h3>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddpchangedb" runat="server" CssClass="form-control">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                       
                                        <asp:TextBox runat="server" ID="txtusername" placeholder="User Name" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-inline form-group">

                                        <asp:TextBox runat="server" ID="txtpassword" placeholder="Password" autocomplete="off" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:Button runat="server" Text="SUBMIT" CssClass="btn btn-default btn-block" ID="submit" OnClick="submit_Click" />
                                    </div>
                                </div>
                                <div id="employ" class="tab-pane fade">
                                    <h3 class="text-center">Employee Login</h3>
                                    <div class="form-group">

                                        
                                        <asp:TextBox runat="server" ID="txtemplogin" placeholder="User Name" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-inline form-group">

                                        <asp:TextBox runat="server" ID="txtemppwsd" placeholder="Password" TextMode="Password" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">

                                        <asp:Button runat="server" Text="SUBMIT" CssClass="btn btn-default btn-block" ID="btnemploy" OnClick="btnemploy_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
