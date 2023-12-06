<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmGroupformt.aspx.cs" Inherits="AksharaWebAppli.Setup.FrmGroupformt" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <h3>Group Registration :-</h3>
            </div>
        </div>
       
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#grpformt">Group Formation</a></li>
                            <li><a data-toggle="tab" href="#grpregiton">Registration</a></li>
                            <li><a data-toggle="tab" href="#grpamend">Amendment</a></li>
                            <li><a data-toggle="tab" href="#grpcomec">Commencement</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="grpformt" class="tab-pane fade in active">

                                <div class="panel panel-default">
                                    <div class="panel-heading clearfix">
                                        <h3 class="panel-title">Group Formation :-</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div>
                                            <asp:GridView ID="dgvfdr" Width="100%" runat="server"
                                                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="5">
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
                                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("grpcode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Duration">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblissuedby" runat="server" Text='<%#Eval("prdduration") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Value">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldt" runat="server" Text='<%#Eval("amts") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Company">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrecp" runat="server" Text='<%#Eval("companychit") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcustnm" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcntct" runat="server" Text='<%#Eval("grpcode") %>'></asp:Label>
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
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel11" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel7" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="form-group">
                                                            <div class="col-md-2">Period :</div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="ddperiod" runat="server" CssClass="form-control">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddperiod" InitialValue="Select" CssClass="text-danger" ErrorMessage="Select Period" ValidationGroup="grfm" />
                                                            </div>
                                                            <div class="col-md-2">Value :</div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="ddchitvalu" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddchitvalu_SelectedIndexChanged" AutoPostBack="true">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddchitvalu" InitialValue="Select" CssClass="text-danger" ErrorMessage="Select Chitvalue" ValidationGroup="grfm" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-md-2">Company Chit :</div>
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtcmpchit" runat="server" CssClass="form-control" autocomplete="off" ReadOnly="true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcmpchit" CssClass="text-danger" ErrorMessage="Company Chit field is required." ValidationGroup="grfm" />
                                                            </div>
                                                            <div class="col-md-2">Group Code :</div>
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtgrpcode" runat="server" CssClass="form-control" autocomplete="off" ReadOnly="true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtgrpcode" CssClass="text-danger" ErrorMessage="Group Code Required." ValidationGroup="grfm" />
                                                            </div>

                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-md-2">
                                                                <asp:CheckBox runat="server" ID="chk_editgrup" Text="Edit Group" CssClass="" AutoPostBack="true" OnCheckedChanged="chk_editgrup_CheckedChanged" />
                                                            </div>
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div class="col-md-4">
                                                                        <asp:TextBox ID="txtmaturdt" runat="server" CssClass="form-control"></asp:TextBox>
                                                                    </div>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="chk_editgrup" EventName="CheckedChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                            <div class="col-md-2">Instalment :</div>
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtinstlmt" runat="server" CssClass="form-control" autocomplete="off" ReadOnly="true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtinstlmt" CssClass="text-danger" ErrorMessage="Instalment Required." ValidationGroup="grfm" />
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddchitvalu" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <div class="form-group">
                                                    <div class="col-md-12"></div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-md-3">Foreman Commission % :</div>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="ddpformncomm" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddpformncomm" InitialValue="Select" CssClass="text-danger" ErrorMessage="Select Foreman Commission." ValidationGroup="grfm" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <asp:Button runat="server" Text="Save" CssClass="btn btn-default btn-success" ID="btnfdr" OnClientClick=" return confirm('Are you sure?')" OnClick="btnfdr_Click" ValidationGroup="grfm" />
                                                        &nbsp;&nbsp;
                                                <asp:Button runat="server" Text="Clear" CssClass="btn btn-default btn-danger" ID="btngrpclr" />
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnfdr" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <div class="clr">
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div id="grpregiton" class="tab-pane fade">
                                <div class="panel panel-default">
                                    <div class="panel-heading clearfix">
                                        <h3 class="panel-title">Registration Details :-</h3>
                                    </div>
                                    <div class="panel-body">

                                        <div>
                                            <asp:GridView ID="dgvreg" Width="100%" runat="server"
                                                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="dgvreg_PageIndexChanging" PageSize="5">
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
                                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("grcode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcod" runat="server" Text='<%#Eval("grcode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="P.S.O No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblpso" runat="server" Text='<%#Eval("grblno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Registration Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblregdt" runat="server" Text='<%#Eval("regdt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Commence Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcommdate" runat="server" Text='<%#Eval("commdt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Termination Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbltermdt" runat="server" Text='<%#Eval("termdt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dividend">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldivi" runat="server" Text='<%#Eval("grdividend") %>'></asp:Label>
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
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel10" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="form-group">
                                                    <div class="col-md-2">Group :</div>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="drpgroup" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpgroup_SelectedIndexChanged" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpgroup" InitialValue="Select" CssClass="text-danger" ErrorMessage="Select Group" ValidationGroup="regfrm" />
                                                    </div>
                                                    <div class="col-md-3">P.S.O No :</div>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtpsono" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpsono" CssClass="text-danger" ErrorMessage="PSO No is required." ValidationGroup="regfrm" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-md-2">Maximum Discount :</div>
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel6" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtmaxdiscnt" runat="server" CssClass="form-control" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmaxdiscnt" CssClass="text-danger" ErrorMessage="Discount is required." ValidationGroup="regfrm" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="drpgroup" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    <div class="col-md-3">PSO Registration Date :</div>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtpsoregdt" runat="server" CssClass="form-control datepicker" onkeydown="return false" ClientIDMode="Static"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpsoregdt" CssClass="text-danger" ErrorMessage="Registration Date is required." ValidationGroup="regfrm" />
                                                    </div>
                                                </div>

                                                <div class="form-group">

                                                    <div class="col-md-2">Commence Date :</div>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtcommdt" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" OnTextChanged="txtcommdt_TextChanged" onkeydown="return false" AutoPostBack="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcommdt" CssClass="text-danger" ErrorMessage="Commence Date is required." ValidationGroup="regfrm" />
                                                    </div>
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel8" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="col-md-3">Termination Date :</div>

                                                            <div class="col-md-3">
                                                                <asp:TextBox ID="txttermdt" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txttermdt" CssClass="text-danger" ErrorMessage="Termination Date is required." ValidationGroup="regfrm" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="txtcommdt" EventName="TextChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-2">Entrance Fee :</div>
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel9" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="col-md-4">
                                                                <asp:TextBox ID="txtentrancfee" runat="server" CssClass="form-control" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtentrancfee" CssClass="text-danger" ErrorMessage="Entrance Fee is required." ValidationGroup="regfrm" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="drpgroup" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    <div class="col-md-6">

                                                        <asp:Button runat="server" Text="Save" CssClass="btn btn-default btn-success" ID="btnregsave" OnClientClick=" return confirm('Are you sure?')" ValidationGroup="regfrm" OnClick="btnregsave_Click" />&nbsp;&nbsp;
                                                <asp:Button runat="server" Text="Clear" CssClass="btn btn-default btn-danger" ID="btnregclear" />

                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnregsave" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <div class="clr"></div>
                                    </div>
                                    <div class="panel-heading clearfix">
                                        <h3 class="panel-title">PSO Details :-</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbnregall" runat="server" CssClass="col-md-2 control-radiobutton" GroupName="grp" Text="All Groups" TextAlign="Right" />
                                            <asp:RadioButton ID="rbnrunng" runat="server" CssClass="col-md-2 control-radiobutton" GroupName="grp" Text="Running Groups" TextAlign="Right" />
                                            <asp:RadioButton ID="rbncomplt" runat="server" CssClass="col-md-2 control-radiobutton" GroupName="grp" Text="Completed Groups" TextAlign="Right" />

                                            <div class="col-md-3">
                                                <asp:DropDownList ID="drppsogroups" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Button runat="server" Text="Reports" CssClass="btn btn-default" ID="btnpdf" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="grpamend" class="tab-pane fade">

                                <div class="panel panel-default">
                                    <div class="panel-heading clearfix">
                                        <h3 class="panel-title">Amendment</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div>
                                            <asp:GridView ID="dgvamd" Width="100%" runat="server"
                                                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="5">
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
                                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("grcode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcod" runat="server" Text='<%#Eval("grcode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="P.S.O No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblpso" runat="server" Text='<%#Eval("fxddt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Registration Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblregdt" runat="server" Text='<%#Eval("fxdmrtdt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Commence Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcommdate" runat="server" Text='<%#Eval("fxddepbank") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Termination Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbltermdt" runat="server" Text='<%#Eval("fxddepbankbranch") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dividend">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldivi" runat="server" Text='<%#Eval("fxddepno") %>'></asp:Label>
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
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>

                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">FDR Value :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Interest Rate :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>

                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Interest Mode :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>MONTHLY</asp:ListItem>
                                                    <asp:ListItem>QUARTERLY</asp:ListItem>
                                                    <asp:ListItem>HALF YEARLY</asp:ListItem>
                                                    <asp:ListItem>YEARLY</asp:ListItem>
                                                    <asp:ListItem>ON MATURITY</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Bank Name :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Bank Branch :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <asp:Label runat="server" CssClass="col-md-2 control-label">FDR Date :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control datepicker" ClientIDMode="Static"></asp:TextBox>

                                            </div>

                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Months :</asp:Label>
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList runat="server" ID="DropDownList2"></asp:DropDownList>

                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Mature Date :</asp:Label>
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <div class="col-md-6 col-md-offset-2">
                                                <asp:Button runat="server" Text="Save" CssClass="btn btn-default" ID="Button1" OnClientClick=" return confirm('Are you sure?')" OnClick="btnfdr_Click" />
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div id="grpcomec" class="tab-pane fade">

                                <div class="panel panel-default">
                                    <div class="panel-heading clearfix">
                                        <h3 class="panel-title">Commencement</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div>
                                            <asp:GridView ID="GridView2" Width="100%" runat="server"
                                                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="5">
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
                                                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>

                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">FDR Value :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Interest Rate :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>

                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Interest Mode :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>MONTHLY</asp:ListItem>
                                                    <asp:ListItem>QUARTERLY</asp:ListItem>
                                                    <asp:ListItem>HALF YEARLY</asp:ListItem>
                                                    <asp:ListItem>YEARLY</asp:ListItem>
                                                    <asp:ListItem>ON MATURITY</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Bank Name :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Bank Branch :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <asp:Label runat="server" CssClass="col-md-2 control-label">FDR Date :</asp:Label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control datepicker" ClientIDMode="Static"></asp:TextBox>

                                            </div>

                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Months :</asp:Label>
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList runat="server" ID="DropDownList4" CssClass="form-control"></asp:DropDownList>

                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label runat="server" CssClass="col-md-2 control-label">Mature Date :</asp:Label>
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <div class="col-md-6 col-md-offset-2">
                                                <asp:Button runat="server" Text="Save" CssClass="btn btn-default" ID="Button2" OnClientClick=" return confirm('Are you sure?')" OnClick="btnfdr_Click" />
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
