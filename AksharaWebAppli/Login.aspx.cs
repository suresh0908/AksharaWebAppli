using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Xml;
using Npgsql;

namespace AksharaWebAppli
{
    public partial class Login : System.Web.UI.Page
    {
        backend_Search back_sh = new backend_Search();
        LogicLyr.Loginfm back_br = new LogicLyr.Loginfm();
        ObjectLyr.ObjectLogin objbo = new ObjectLyr.ObjectLogin();


        int chkusr;
        string msgg = "Invalid Details";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDropDown();
            }
        }
        private void FillDropDown()
        {
            try
            {
                back_sh.opn_();
                back_sh.load("select distinct accid,branch from stat_branch order by branch", ddpchangedb, "Select Database", "branch");
                back_sh.close_();
            }
            catch (Exception ii)
            { back_sh.alert(ii.ToString()); }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            /* Changedatabasename("connectionString");*/
           /* Session["loginid"] = txtusername.Text;
            Session["brnc"] = ddpchangedb.SelectedValue;*/

            objbo.usernm = txtusername.Text;
            objbo.passwrd = txtpassword.Text;
            chkusr = back_br.login(ddpchangedb.SelectedValue, objbo);
            if (chkusr == 1)
                Response.Redirect("~/Setup/Frmsubcat.aspx");
            else
            {
                Response.Write("<script>alert('" + msgg + "')</script>");
            }
        }

        protected void btnemploy_Click(object sender, EventArgs e)
        {
            /*Session["loginid"] = txtemplogin.Text;
            Session["brnc"] = "KOTHAGUDEM2";*/


            objbo.usernm = txtemplogin.Text;
            objbo.passwrd = txtemppwsd.Text;
            chkusr = back_br.login("KOTHAGUDEM2", objbo);
            if (chkusr == 1)
                Response.Redirect("~/Setup/Frmsubcat.aspx");
            else
                Response.Write("<script>alert('" + msgg + "')</script>");
        }
    }
}