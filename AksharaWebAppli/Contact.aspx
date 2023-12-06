<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AksharaWebAppli.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3 style="margin-left:110px;">Contact Us :- </h3>
    <div class="container">
            <div class="row mt-80">
                <div class="col-md-6">


                    <div class="form-group">
                        <asp:TextBox ID="name" runat="server" CssClass="form-control" autocomplete="off" placeholder="Your Name"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" Display="Dynamic"
                                        ForeColor="Red" SetFocusOnError="true" ErrorMessage="Enter Name" ValidationGroup="add"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" autocomplete="off" placeholder="Your Email"></asp:TextBox>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Valid Email ID" Display="Dynamic"
                                        ValidationGroup="add" ControlToValidate="email" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> </asp:RegularExpressionValidator>

                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="mobile" runat="server" CssClass="form-control" autocomplete="off" placeholder="Your Mobile No"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone Number is not valid"
                                        ValidationGroup="add" ControlToValidate="mobile" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[56789]\d{9}$"> </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mobile" Display="Dynamic"
                                        ForeColor="Red" SetFocusOnError="true" ErrorMessage="Enter Mobile No" ValidationGroup="add"></asp:RequiredFieldValidator>
                    </div>



                    <div class="form-group">
                        <asp:TextBox ID="message" runat="server" CssClass="form-control textarea" placeholder="Your Message"  TextMode="MultiLine"></asp:TextBox>

                    </div>
                    <asp:Button runat="server" ID="save" Text="Submit" CssClass="btn btn-primary btn-lg" Style="height:36px;background-color:orangered" ValidationGroup="add" />

                </div>

                <div class="col-md-5 col-md-offset-1 contact-info">
                    <h3>Office Location</h3>
                    <address>
                        Akshara Chit Funds Pvt.Ltd.<br />
                        H.NO:1-8-571., Near Water Tank, Balasamudram, Nakkalagutta<br />
                        HANAMKONDA, TELANGANA,
                 <br />
                        INDIA-506001.
                       
                    </address>

                    <h3>Contact Info</h3>
                    <address>
                      
                        A.G.M-Administration<br />
                        <a href="#" class="icon-holder">
                            <i class="fa fa-mobile"></i>
                        </a> 000000000<br />
                        <a href="#" class="icon-holder">
                            <i class="fa fa-phone"></i>
                        </a> 0870-2973335<br />
                        <strong>Support:</strong> <a href="mailto:hanamkondazo@aksharachits.com"><i class="fa fa-envelope"></i> hanamkondazo@aksharachits.com</a>
                    </address>

                    <h3>Business hours</h3>
                    <p>
                        <span>Mon - Fri: 9am to 6pm</span>
                        <br/>
                        <span>Sat : 9am to 1pm</span>
                    </p>
                </div>
            </div>
        </div>
   

    <%--<address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>--%>
</asp:Content>
