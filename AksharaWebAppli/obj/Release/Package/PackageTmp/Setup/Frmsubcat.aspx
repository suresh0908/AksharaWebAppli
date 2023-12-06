<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Frmsubcat.aspx.cs" Inherits="AksharaWebAppli.Setup.Frmsubcat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <div class="container">
         <div class="form-group">
             <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <h3>Sub Category Set Up :-</h3>
            </div>
        </div>
         </div>
       
         <div class="row">
             <div class="col-md-6">
                 <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                     <ContentTemplate>
                         <div class="form-group">
                             <div class="row">
                                 <div class="col-md-2">
                                 </div>
                                 <div class="col-md-3">
                                     <asp:Label runat="server" Text="Account Head :" CssClass="control-label">  </asp:Label>
                                 </div>
                                 <div class="col-md-7">
                                     <asp:DropDownList ID="drdacchead" runat="server" CssClass="form-control"
                                         AutoPostBack="true" ValidationGroup="save" ClientIDMode="Static" OnSelectedIndexChanged="drdacchead_SelectedIndexChanged">
                                     </asp:DropDownList>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="drdacchead" InitialValue="Select" ValidationGroup="save" CssClass="text-danger" ErrorMessage="Select Account Head" />
                                 </div>

                             </div>
                         </div>
                         <div class="form-group">
                             <div class="row">
                                 <div class="col-md-2">
                                 </div>
                                 <div class="col-md-3">
                                     <asp:Label runat="server" Text="Subcategory :" CssClass="control-label">  </asp:Label>
                                 </div>
                                 <div class="col-md-7">
                                     <asp:TextBox ID="txtsubcat" runat="server" ValidationGroup="save" autocomplete="off" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="txtsubcat" ValidationGroup="save" CssClass="text-danger" ErrorMessage="Enter Subcategory." />
                                 </div>

                             </div>
                         </div>

                         <div class="form-group">
                             <div class="row">
                                 <div class="col-md-2">
                                 </div>
                                 <div class="col-md-3">
                                 </div>
                                 <div class="col-md-7">
                                     <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-default btn-success"
                                         ValidationGroup="save" OnClick="btnsave_Click" OnClientClick=" return confirm('Are you sure?')" />&nbsp;&nbsp;
                                                <asp:Button runat="server" Text="Clear" CssClass="btn btn-default btn-danger" ID="btnregclear" />
                                 </div>

                             </div>
                         </div>
                     </ContentTemplate>
                     <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click" />
                     </Triggers>
                 </asp:UpdatePanel>
             </div>
             <div class="col-md-6">
                 <div class="form-group">
                     <asp:UpdatePanel runat="server" ID="UpdatePanel10" UpdateMode="Conditional">
                         <ContentTemplate>
                             <div class="col-md-12">
                                 <asp:GridView ID="dgvsubct" Width="100%" runat="server"
                                     BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                                     ShowHeaderWhenEmpty="true" AutoGenerateColumns="false"
                                     CssClass="table table-striped table-bordered table-hover" AllowPaging="true"
                                     PageSize="8" OnPageIndexChanging="dgvsubct_PageIndexChanging">
                                     <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                     <HeaderStyle Font-Bold="True" ForeColor="Black" />
                                     <PagerStyle ForeColor="#222222" HorizontalAlign="Center" />
                                     <RowStyle BackColor="White" ForeColor="Black" />
                                     <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="Black" />
                                     <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                     <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                     <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                     <SortedDescendingHeaderStyle BackColor="#93451F" />
                                     <Columns>
                                         <asp:TemplateField HeaderText="S.No">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblsno" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Subcategory">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblissuedby" runat="server" Text='<%#Eval("vchaccname") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </Columns>
                                 </asp:GridView>
                             </div>
                         </ContentTemplate>
                         <Triggers>
                             <asp:AsyncPostBackTrigger ControlID="drdacchead" EventName="SelectedIndexChanged" />
                         </Triggers>
                     </asp:UpdatePanel>
                     <div class="col-md-2">
                     </div>
                 </div>
             </div>
         </div>
     </div>

    
</asp:Content>
