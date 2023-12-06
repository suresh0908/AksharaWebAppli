using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicLyr;
using ObjectLyr;
using System.Data;

namespace AksharaWebAppli.Setup
{
    public partial class Frmsubcat : System.Web.UI.Page
    {
        LogicLyr.LogicSubcat lsubcat = new LogicLyr.LogicSubcat();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadacchead();
                loadsubcat();
            }
        }
        void loadacchead()
        {
            DataTable dt;
            dt = lsubcat.loadacchead();
            drdacchead.DataSource = dt;
            drdacchead.DataTextField = "vchaccname";
            drdacchead.DataValueField = "vchaccid";
            drdacchead.DataBind();
            drdacchead.Items.Insert(0, new ListItem("Select"));
            drdacchead.SelectedIndex = 0;
        }

        protected void drdacchead_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadsubcat();
        }
        void loadsubcat()
        {
            DataTable dt;
            ObjectSubcat obj = new ObjectSubcat();
            obj.paccname = drdacchead.SelectedItem.ToString();
            dt = lsubcat.load_subcat(obj);
            dgvsubct.DataSource = dt;
            dgvsubct.DataBind();
            txtsubcat.Text = string.Empty;
        }

        protected void dgvsubct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvsubct.PageIndex = e.NewPageIndex;
            loadsubcat();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            insertsubcat();
        }
        void insertsubcat()
        {
            string chk = "";
            string msgg = "Added Success fully";
            ObjectSubcat obj = new ObjectSubcat();
            obj.accname = txtsubcat.Text;
            obj.paccid = drdacchead.SelectedValue;
            chk = lsubcat.insertsubcat(obj);
            if(chk=="")
            {
                Response.Write("<script>alert('" + msgg + "')</script>");
                
                loadsubcat();
            }
               

        }
    }
}