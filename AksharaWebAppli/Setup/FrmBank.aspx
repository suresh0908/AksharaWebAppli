<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmBank.aspx.cs" Inherits="AksharaWebAppli.Setup.FrmBank" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
       <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"  EnablePageMethods="true"></asp:ScriptManager>--%>
        <div class="form-group">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <h3>Bank Set Up :-</h3>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="form-group">

                <div class="col-md-12">
                    <asp:GridView ID="dgvbnk" Width="100%" runat="server"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                        CssClass="table table-striped table-bordered table-hover" AllowPaging="True"
                        PageSize="5" OnRowCommand="dgvbnk_RowCommand" OnPageIndexChanging="dgvbnk_PageIndexChanging">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle Font-Bold="True" ForeColor="Black" />
                        <PagerStyle ForeColor="#222222" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="Black" />
                        <SelectedRowStyle  BackColor="#738A9C"  Font-Bold="True" ForeColor="Black"/>
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                        <Columns>
                            <asp:TemplateField HeaderText="Bank Id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblbnkid" Text='<%#Eval("vchbankid") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblvchaccname" runat="server" Text='<%#Eval("vchaccname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bank Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblvchbankname" runat="server" Text='<%#Eval("vchbankname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bank Brnch">
                                <ItemTemplate>
                                    <asp:Label ID="lblvchbankbranch" runat="server" Text='<%#Eval("vchbankbranch") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblvchaccno" runat="server" Text='<%#Eval("vchaccno") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Over Draft Limit">
                                <ItemTemplate>
                                    <asp:Label ID="lblnumoverdraft" runat="server" Text='<%#Eval("numoverdraft") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button Text="Edit" runat="server" ValidationGroup="select" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-md-2">
                </div>



            </div>
        </div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#bnkdtls">Bank Details   </a></li>
                    <li><a data-toggle="tab" href="#bnkaddr">Address  </a></li>
                </ul>
                <div class="tab-content">
                    <div id="bnkdtls" class="tab-pane fade in active">

                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h3 class="panel-title">Bank Details</h3>
                            </div>
                            <div class="panel-body">
                                <div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="" CssClass="col-md-2 control-label">Board Resolution NO :</asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtbrno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ValidationGroup="save" ControlToValidate="txtbrno" CssClass="text-danger"
                                                ErrorMessage="Board Resolution NO is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Board Resolution Date :" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtbrndate" runat="server" autocomplete="off" CssClass="form-control datepicker"
                                                ClientIDMode="Static" OnKeypress="return false"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbrndate" CssClass="text-danger"
                                                ErrorMessage="Board Resolution Date is required." />
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Bank :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtbnknm" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbnknm" CssClass="text-danger"
                                                ErrorMessage="Bank Name is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Account Type :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="drdactyp" runat="server" CssClass="form-control">
                                                <asp:ListItem>General</asp:ListItem>
                                                <asp:ListItem>Bidpayable</asp:ListItem>
                                                <asp:ListItem>Pettycash</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="drdactyp" CssClass="text-danger"
                                                ErrorMessage="Account Type is required." />
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Branch :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtbnkbrnch" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbnkbrnch" CssClass="text-danger"
                                                ErrorMessage="Bank Branch is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Account Name :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtaccname" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtaccname" CssClass="text-danger"
                                                ErrorMessage="Account Name is required." />
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Account No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtaccno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtaccno" CssClass="text-danger"
                                                ErrorMessage="Account No is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Over Draft Limit :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtovrdrft" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtovrdrft" CssClass="text-danger"
                                                ErrorMessage="Over Draft Limit is required." />
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <asp:Label runat="server" Text="IFSC Code  :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtbnkifc" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbnkifc" CssClass="text-danger"
                                                ErrorMessage="IFSC Code is required." />
                                        </div>
                                        <asp:Label runat="server" Text="UPI :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-2">
                                            <asp:TextBox ID="txtupi1" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="col-md-2">
                                            <asp:TextBox ID="txtupi2" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtupi2" CssClass="text-danger"
                                                ErrorMessage="UPI is required." />
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Mobile No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtmobno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmobno" CssClass="text-danger"
                                                ErrorMessage="Mobile No is required." />

                                        </div>
                                        <asp:Label runat="server" Text="Landline No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtlndno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtlndno" CssClass="text-danger"
                                                ErrorMessage="Landline No is required." />

                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Email ID :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtemail" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="col-md-2"></div>
                                        <div class="col-md-4">
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>

                    <div id="bnkaddr" class="tab-pane fade">

                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h3 class="panel-title">Bank Address</h3>
                            </div>
                            <div class="panel-body">
                                <div>
                                     <div class="form-group">

                                        <asp:Label runat="server" Text="Door No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtdrno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtdrno" CssClass="text-danger"
                                                ErrorMessage="Door NO is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Street/Village :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtstreet" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtstreet" CssClass="text-danger"
                                                ErrorMessage="Street/Village is required." />
                                        </div>
                                    </div>

                                     <div class="form-group">

                                        <asp:Label runat="server" Text="Area/Mandal :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtarea" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtarea" CssClass="text-danger"
                                                ErrorMessage="Area/Mandal is required." />
                                        </div>
                                        <asp:Label runat="server" Text="City/District :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtcity" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcity" CssClass="text-danger"
                                                ErrorMessage="City/District is required." />
                                        </div>
                                    </div>

                                      <div class="form-group">

                                        <asp:Label runat="server" Text="State :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">

                                            <asp:TextBox ID="txtstate" runat="server" CssClass="form-control"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtstate" CssClass="text-danger"
                                                ErrorMessage="State is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Location :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtloc" runat="server"  CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtloc" CssClass="text-danger"
                                                ErrorMessage="Location is required." />
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Pincode :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpincode" CssClass="text-danger"
                                                ErrorMessage="Pincode is required." />
                                        </div>
                                         <div class="col-md-4"></div>
                                         <div class="col-md-2">
                                             <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-default btn-success" 
                                                 OnClick="btnsave_Click" OnClientClick=" return confirm('Are you sure?')" />&nbsp;&nbsp;
                                                <asp:Button runat="server" Text="Clear" CssClass="btn btn-default btn-danger" ID="btnregclear" />
                                         </div>
                                      
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>


            </div>

        </div>
    </div>

    
</asp:Content>
