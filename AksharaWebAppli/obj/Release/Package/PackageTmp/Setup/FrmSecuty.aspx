<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmSecuty.aspx.cs" Inherits="AksharaWebAppli.Setup.FrmSecuty" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <h3>Chit Security (FDR) :-</h3>
            </div>
        </div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#fdrdtl">FDR</a></li>
                    <li><a data-toggle="tab" href="#mortdtl">Mortgage</a></li>
                </ul>
                <div class="tab-content">
                    <div id="fdrdtl" class="tab-pane fade in active">
                       
                                <div class="panel panel-default">
                                    <div class="panel-heading clearfix">
                                        <h3 class="panel-title">FDR Details</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div>
                                        <asp:GridView ID="dgvfdr" Width="100%" runat="server"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="6">
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
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("fxddepno") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Value">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldt" runat="server" Text='<%#Eval("fxddepvalue") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblissuedby" runat="server" Text='<%#Eval("fxddt") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mature Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrecp" runat="server" Text='<%#Eval("fxdmrtdt") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bank">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcustnm" runat="server" Text='<%#Eval("fxddepbank") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bank Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcntct" runat="server" Text='<%#Eval("fxddepbankbranch") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="FDR Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbladdr" runat="server" Text='<%#Eval("fxddepno") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnprnt" runat="server" ImageUrl="~/Img/prnt.jpg" ToolTip="Print" Width="21px" Height="21px" 
                                            OnClick="btnprint_Click"  OnClientClick="javascript:return confirm('Sure to Print ...?');document.forms[0].target = '_blank';"  CausesValidation="false" />
                                            <asp:ImageButton ID="btnedit" runat="server" ImageUrl="~/Img/btn_edit.gif" ToolTip="Edit" Width="21px" Height="21px" 
                                             OnClick="btnEdit_Click" OnClientClick="javascript:return confirm('Sure to Edit ...?');"
                                    CausesValidation="false" />
                                             <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/img/btn_delete.gif" ToolTip="Delete" Width="21px" Height="21px" 
                                            OnClick="btnDelete_Click"  OnClientClick="javascript:return confirm('Sure to Delete ...?');"  CausesValidation="false" />
                                       </ItemTemplate>
                                    </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                            </div>
                                       <div class="clr"></div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">FDR A/C No :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtsecurtyno" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtsecurtyno" CssClass="text-danger" ErrorMessage="FDR A/C No field is required." />
                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">FDR Value :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtvalue_sec" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtvalue_sec" CssClass="text-danger" ErrorMessage="FDR Value field is required." />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Interest Rate :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtinstrate_sec" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtinstrate_sec" CssClass="text-danger" ErrorMessage="Interest Rate field is required." />
                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Interest Mode :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddpinterstmode" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>MONTHLY</asp:ListItem>
                                                    <asp:ListItem>QUARTERLY</asp:ListItem>
                                                    <asp:ListItem>HALF YEARLY</asp:ListItem>
                                                    <asp:ListItem>YEARLY</asp:ListItem>
                                                    <asp:ListItem>ON MATURITY</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddpinterstmode" CssClass="text-danger" InitialValue="Select" ErrorMessage="Interest Mode field is required." />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Bank Name :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtbanknm" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbanknm" CssClass="text-danger" ErrorMessage="Bank Name field is required." />
                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Bank Branch :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtbnkbrn_sec" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbnkbrn_sec" CssClass="text-danger" ErrorMessage="Bank Branch field is required." />
                                            </div>
                                        </div>
                                         
                                        <div class="form-group">

                                            <asp:Label runat="server" CssClass="col-md-2 control-label">FDR Date :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtfdrdat" runat="server" CssClass="form-control datepicker" ClientIDMode="Static"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtfdrdat" CssClass="text-danger" ErrorMessage="Mature Date field is required." />
                                            </div>

                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Months :</asp:Label>
                                           <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList runat="server" ID="ddpperiod" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddpperiod_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddpperiod" CssClass="text-danger" ErrorMessage="Bank Branch field is required." />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Mature Date :</asp:Label>
                                             <asp:UpdatePanel runat="server" ID="uptpnlfdr" UpdateMode="Always">
                                                <ContentTemplate>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtmaturdt" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmaturdt" CssClass="text-danger" ErrorMessage="Mature Date field is required." />
                                            </div>
                                                    </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <div class="col-md-6 col-md-offset-2">
                                                <asp:Button runat="server" Text="Save" CssClass="btn btn-default" ID="btnfdr"   onClientClick=" return confirm('Are you sure?')" OnClick="btnfdr_Click" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                           
                    </div>

                    <div id="mortdtl" class="tab-pane fade">

                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h3 class="panel-title">Mortgage Details</h3>
                            </div>
                            <div class="panel-body">

                                <asp:GridView ID="dgvmort" Width="100%" runat="server"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="6">
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
                                                <asp:Label ID="lblsno1" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmrt" runat="server" Text='<%#Eval("mortdealno") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Deed Value">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmrtvlu" runat="server" Text='<%#Eval("mortvlu") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mortgage Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmortdt" runat="server" Text='<%#Eval("mordt") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Details">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmrtdtls" runat="server" Text='<%#Eval("detls") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Deed No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmrtdelno" runat="server" Text='<%#Eval("mortdealno") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnprnt" runat="server" ImageUrl="~/Img/prnt.jpg" ToolTip="Print" Width="21px" Height="21px" 
                                            OnClick="btnprint_Click"  OnClientClick="javascript:return confirm('Sure to Print ...?');document.forms[0].target = '_blank';"  CausesValidation="false" />
                                            <asp:ImageButton ID="btnedit" runat="server" ImageUrl="~/Img/btn_edit.gif" ToolTip="Edit" Width="21px" Height="21px" 
                                             OnClick="btnEdit_Click" OnClientClick="javascript:return confirm('Sure to Edit ...?');"
                                    CausesValidation="false" />
                                             <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/img/btn_delete.gif" ToolTip="Delete" Width="21px" Height="21px" 
                                            OnClick="btnDelete_Click"  OnClientClick="javascript:return confirm('Sure to Delete ...?');"  CausesValidation="false" />
                                       </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        
    </div>
</asp:Content>
