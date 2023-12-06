<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmpersonreg.aspx.cs" Inherits="AksharaWebAppli.Setup.frmpersonreg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
          <div class="form-group">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <h3>One Time Registration</h3>
                </div>
            </div>
        </div>

     <%--     <div class="col-md-12">
            <div class="form-group">

                <div class="col-md-12">
                    <asp:GridView ID="dgvperson" Width="100%" runat="server"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                        CssClass="table table-striped table-bordered table-hover" AllowPaging="True"
                        PageSize="8">
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
                            <asp:TemplateField HeaderText="Registration Id">
                                <ItemTemplate>
                                    <asp:Label ID="lblrid" Text='<%#Eval("regid") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sur Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblsurname" runat="server" Text='<%#Eval("surname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile No">
                                <ItemTemplate>
                                    <asp:Label ID="lblmobno" runat="server" Text='<%#Eval("mobileno") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Aather No">
                                <ItemTemplate>
                                    <asp:Label ID="lblaatherno" runat="server" Text='<%#Eval("aatherno") %>'></asp:Label>
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
        </div>--%>

         <div class="row">

             <div class="col-md-12 col-sm-12 col-xs-12">
                 <ul class="nav nav-tabs">
                     <li class="active"><a data-toggle="tab" href="#persdtls">Person Details   </a></li>
                     <li><a data-toggle="tab" href="#percntaddr">Contact Address  </a></li>
                     <li><a data-toggle="tab" href="#perpermaddr">Permanent Address  </a></li>
                 </ul>
                 <div class="tab-content">

                     <div id="persdtls" class="tab-pane fade in active">

                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h3 class="panel-title">Person Details</h3>
                            </div>
                            <div class="panel-body">
                                <div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="" CssClass="col-md-2 control-label">Name :</asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtname" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtname" CssClass="text-danger"
                                                ErrorMessage="Name is required." />
                                        </div>
                                        <asp:Label runat="server" Text="SurName :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtsurname" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtsurname" CssClass="text-danger"
                                                ErrorMessage="SurName is required." />
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Father/Husband Name :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtfname" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtfname" CssClass="text-danger"
                                                ErrorMessage="Father/Husband Name is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Date Of Birth :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">

                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtdob" runat="server" autocomplete="off" CssClass="form-control datepicker"
                                                            ClientIDMode="Static" OnKeypress="return false" onkeydown="return false"
                                                            onpaste="return false" AutoPostBack="true" OnTextChanged="txtdob_TextChanged"></asp:TextBox>
                                                    </td>

                                                    <td>&nbsp;Age:&nbsp;</td>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:TextBox ID="txtage" runat="server" ReadOnly="true" BackColor="White" autocomplete="off"
                                                                    CssClass="form-control" Width="50"></asp:TextBox>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="txtdob" EventName="TextChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>

                                                    </td>

                                                </tr>
                                            </table>

                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtdob" CssClass="text-danger"
                                                ErrorMessage="Date Of Birth is required." />
                                        </div>

                                    </div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Gender :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="drdgender" runat="server" CssClass="form-control">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server" InitialValue="Select" ControlToValidate="drdgender" CssClass="text-danger"
                                                ErrorMessage="Gender is required." />
                                        </div>
                                         <div class="col-md-1"></div>
                                        <asp:Label runat="server" Text="Merital Status :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-3">
                                           <asp:DropDownList ID="drdmstatus" runat="server" CssClass="form-control">
                                               <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem>Married</asp:ListItem>
                                                <asp:ListItem>Un Married</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server"  InitialValue="Select" ControlToValidate="drdmstatus" CssClass="text-danger"
                                                ErrorMessage="Merital Status is required." />
                                        </div>
                                        <div class="col-md-1"></div>
                                    </div>
                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Mobile No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtmobno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmobno" CssClass="text-danger"
                                                ErrorMessage="Mobile No is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Aather No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtaatherno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtaatherno" CssClass="text-danger"
                                                ErrorMessage="Aather No is required." />
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <asp:Label runat="server" Text="PAN No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpanno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"  ValidationGroup="non" ControlToValidate="txtpanno" CssClass="text-danger"
                                                ErrorMessage="PAN No is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Email ID :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtemail" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                 

                                </div>
                            </div>

                        </div>

                    </div>

                      <div id="percntaddr" class="tab-pane fade">

                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h3 class="panel-title">Person Contact Address</h3>
                            </div>
                            <div class="panel-body">
                                <div>
                                     <div class="form-group">

                                        <asp:Label runat="server" Text="Door No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtcntdrno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcntdrno" CssClass="text-danger"
                                                ErrorMessage="Door NO is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Street/Village :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtcntstreet" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcntstreet" CssClass="text-danger"
                                                ErrorMessage="Street/Village is required." />
                                        </div>
                                    </div>

                                     <div class="form-group">

                                        <asp:Label runat="server" Text="Area/Mandal :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtcntarea" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcntarea" CssClass="text-danger"
                                                ErrorMessage="Area/Mandal is required." />
                                        </div>
                                        <asp:Label runat="server" Text="City/District :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtcntcity" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcntcity" CssClass="text-danger"
                                                ErrorMessage="City/District is required." />
                                        </div>
                                    </div>

                                      <div class="form-group">

                                        <asp:Label runat="server" Text="State :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">

                                            <asp:TextBox ID="txtcntstate" runat="server"  autocomplete="off" CssClass="form-control"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcntstate" CssClass="text-danger"
                                                ErrorMessage="State is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Country :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtcntloc" runat="server"  autocomplete="off"  CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcntloc" CssClass="text-danger"
                                                ErrorMessage="Country is required." />
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Pincode :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtcntpincode" runat="server"  autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcntpincode" CssClass="text-danger"
                                                ErrorMessage="Pincode is required." />
                                        </div>
                                         <div class="col-md-4"></div>
                                         <div class="col-md-2">
                                            

                                         </div>
                                      
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                     
                    <div id="perpermaddr" class="tab-pane fade">

                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h3 class="panel-title">Person Permanent Address</h3>
                            </div>
                            <div class="panel-body">
                                <div>
                                     <div class="form-group">

                                        <asp:Label runat="server" Text="Door No :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpermdrno" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpermdrno" CssClass="text-danger"
                                                ErrorMessage="Door NO is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Street/Village :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpermstreet" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpermstreet" CssClass="text-danger"
                                                ErrorMessage="Street/Village is required." />
                                        </div>
                                    </div>

                                     <div class="form-group">

                                        <asp:Label runat="server" Text="Area/Mandal :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpermarea" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpermarea" CssClass="text-danger"
                                                ErrorMessage="Area/Mandal is required." />
                                        </div>
                                        <asp:Label runat="server" Text="City/District :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpermcity" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpermcity" CssClass="text-danger"
                                                ErrorMessage="City/District is required." />
                                        </div>
                                    </div>

                                      <div class="form-group">

                                        <asp:Label runat="server" Text="State :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">

                                            <asp:TextBox ID="txtpermstate" runat="server"  autocomplete="off" CssClass="form-control"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpermstate" CssClass="text-danger"
                                                ErrorMessage="State is required." />
                                        </div>
                                        <asp:Label runat="server" Text="Country :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpermloc" runat="server"  autocomplete="off"  CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpermloc" CssClass="text-danger"
                                                ErrorMessage="Country is required." />
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <asp:Label runat="server" Text="Pincode :" CssClass="col-md-2 control-label"></asp:Label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtpermpincode" runat="server"  autocomplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpermpincode" CssClass="text-danger"
                                                ErrorMessage="Pincode is required." />
                                        </div>
                                         <div class="col-md-4"></div>
                                         <div class="col-md-2">
                                             <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" CssClass="btn btn-default" 
                                                 />

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
