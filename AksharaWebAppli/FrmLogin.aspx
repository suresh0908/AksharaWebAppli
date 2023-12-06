<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="AksharaWebAppli.FrmLogin" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-4 col-md-offset-4" style="margin-top: 40px">  
            <div class="login-panel panel panel-default">  
  
                <div class="panel-heading" style="background-color: lightgreen">  
                    <h3 class="panel-title" style="text-align: center">Change Database in Web.config</h3>  
                </div>  
                <div class="panel-body">  
                    <div class="form-group">  
                        <asp:DropDownList ID="ddpchangedb" runat="server" CssClass="form-control">  
                            <asp:ListItem></asp:ListItem>  
                        </asp:DropDownList>  
                    </div>  
                    <div class="form-group">  
                        <asp:Button ID="Button1" runat="server" Text="Change Database" OnClick="Button1_Click" CssClass="btn-block" />  
                    </div>  
                </div>  
            </div>  
        </div>  
</asp:Content>
