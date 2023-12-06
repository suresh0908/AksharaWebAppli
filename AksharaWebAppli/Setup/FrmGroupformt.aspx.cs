using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Configuration;
using LogicLyr;
using ObjectLyr;

namespace AksharaWebAppli.Setup
{
    public partial class FrmGroupformt : System.Web.UI.Page
    {
        #region "Create and Initialize objects "

        LogicGroup objgroup_LA = new LogicGroup();
        ObjectGroup objgroup_BO = new ObjectGroup();
        ObjectRegi objgreg_BO = new ObjectRegi();

        #endregion

        public int brnch = 0;
        String acdy = "", entry_dt = "", pyrcpt = "";
        DateTime fdate, mdate;
        static Double mxdict = 0;
        static Double eefe = 0;
        static String chserices="";

        protected void Page_Load(object sender, EventArgs e)
        {
            GetIndiaDate();
            if (!this.Page.IsPostBack)
            {
                ldfrm();
            }
        }
        void ldfrm()
        {
            ldGrpfrm();
            ldRegfrm();
            txtpsoregdt.Text = Convert.ToDateTime(entry_dt).ToString("dd/MM/yyyy");
            txtcommdt.Text = Convert.ToDateTime(entry_dt).ToString("dd/MM/yyyy");
          /*  txttermdt.Text = Convert.ToDateTime(entry_dt).ToString("dd/MM/yyyy");*/
            txtmaturdt.Enabled = false;
            txtmaturdt.Text = txtgrpcode.Text;
        }
        void GetIndiaDate()
        {
            TimeZoneInfo Ind_dat = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime dat = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, Ind_dat);
            entry_dt = Convert.ToDateTime(dat).ToString("yyyy/MM/dd hh:mm:ss");
        }

        #region "Clear/Reset controls"
        private void ClearGrpFormt()
        {
            ddperiod.SelectedIndex = 0;
            ddchitvalu.SelectedIndex = 0;
            ddpformncomm.SelectedIndex = 0;
            txtmaturdt.Text = string.Empty;
            txtgrpcode.Text = string.Empty;
            txtcmpchit.Text = string.Empty;
            txtinstlmt.Text = string.Empty;
            chserices = "";
            mxdict = 0;
            chk_editgrup.Checked = false;
            DgvlLoad();
        }
        private void ClearGrpRegrtn()
        {
            drpgroup.SelectedIndex = 0;
            txtpsoregdt.Text = Convert.ToDateTime(entry_dt).ToString("dd/MM/yyyy");
            txtcommdt.Text = Convert.ToDateTime(entry_dt).ToString("dd/MM/yyyy");
            txttermdt.Text = string.Empty;
            txtmaxdiscnt.Text = string.Empty;
            txtentrancfee.Text = string.Empty;
            RegtLoad();
        }
        #endregion

        void ldGrpfrm()
        {
            DgvlLoad();
            ldchitperiod();
            ldchitvalu();
            ldforemencm();
        }
        void ldRegfrm()
        {
            RegtLoad();
            ldchitgroupUnrg();
            rbnregall.Checked = true;
        }
       
        /*GROUP FORMATION*/
        #region
        void ldchitperiod()
        {
            try
            {
               /* DataTable dt;
                dt = objgroup_LA.DropdwnChitperiod();
                ddperiod.DataSource = dt;
                ddperiod.DataTextField = dt.Columns[1].ToString();
                ddperiod.DataValueField = dt.Columns[0].ToString();
                ddperiod.DataBind();
                ddperiod.Items.Insert(0, new ListItem("Select"));*/

                objgroup_LA.loadchitprd(ddperiod);
            }
            catch (Exception ii)
            {
                Response.Write("Oops! error occured :" + ii.Message.ToString());
            }
        }

        void ldchitvalu()
        {
            try
            {
                DataTable dt;
                dt = objgroup_LA.DropdwnChitValue();
                ddchitvalu.DataSource = dt;
                ddchitvalu.DataTextField = dt.Columns[1].ToString();
                ddchitvalu.DataValueField = dt.Columns[0].ToString();
                ddchitvalu.DataBind();
                ddchitvalu.Items.Insert(0, new ListItem("Select"));

            }
            catch (Exception ii)
            {
                Response.Write("Oops! error occured :" + ii.Message.ToString());
            }
        }
        void ldforemencm()
        {
            try
            {
                DataTable dt;
                dt = objgroup_LA.DropdwnForman();
                ddpformncomm.DataSource = dt;
                
                ddpformncomm.DataTextField = dt.Columns[1].ToString();
                ddpformncomm.DataValueField = dt.Columns[0].ToString();
                ddpformncomm.DataBind();
                ddpformncomm.Items.Insert(0, new ListItem("Select"));
            }
            catch (Exception ii)
            {
                Response.Write("Oops! error occured :" + ii.Message.ToString());
            }
        }
        void DgvlLoad()
        {
            try
            {
                 dgvfdr.DataSource = objgroup_LA.UnregiterDetails();
                 dgvfdr.DataBind();
            }
            catch (Exception ii)
            { Response.Write("Oops! error occured :" + ii.Message.ToString()); }
        }
        protected void dgv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvfdr.PageIndex = e.NewPageIndex;
            DgvlLoad();
        }
        protected void btnfdr_Click(object sender, EventArgs e)
        {
            try
            {
                string msgg = "";
                int chk = 0;

                if (ddperiod.SelectedIndex > 0 && ddchitvalu.SelectedIndex > 0 && ddpformncomm.SelectedIndex > 0)
                {
                    objgroup_BO.ChitGroupCode = txtgrpcode.Text;
                    objgroup_BO.ChitPeriodvalcode = ddperiod.SelectedValue;
                    objgroup_BO.chitgrpseries = chserices;
                    objgroup_BO.actflgGF = "Y";
                    objgroup_BO.ChitgrpStatus = "UN REGISTERED";
                    objgroup_BO.Chitvalucode = ddchitvalu.SelectedValue;
                    objgroup_BO.ChitPeriodval = mxdict;
                    objgroup_BO.FormenCommis = Convert.ToDouble(ddpformncomm.SelectedValue);

                    chk = objgroup_LA.SaveChitGroup(objgroup_BO);
                    if (chk > 0)
                    {

                        msgg = "Insert Successfully";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "window.onload = function(){ alert('" + msgg + "')};", true);
                        ClearGrpFormt();
                        ldRegfrm();
                    }
                    else
                    {
                        msgg = "Not Inserted.";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "window.onload = function(){ alert('" + msgg + "')};", true);
                    }
                }
            }
            catch (Exception ii)
            {
                Response.Write("Oops! error occured :" + ii.Message.ToString());
            }
            finally
            {
                objgroup_LA = null;
                objgroup_BO = null;
            }
        }
        protected void chk_editgrup_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_editgrup.Checked == true)
            {
                txtmaturdt.Enabled = true;
               // ct_txtln = txtmaturdt.Text.Length;
            }
            else
                txtmaturdt.Enabled = false;
        }
        protected void ddchitvalu_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddchitvalu.SelectedIndex > 0 && ddperiod.SelectedIndex > 0)
            {
                mxdict = 0;

                objgroup_BO.ChitPeriod = ddperiod.SelectedItem.Text;
                objgroup_BO.Chitvalucode = ddchitvalu.SelectedValue;

                string[] asnreslt = new string[4];
                asnreslt = objgroup_LA.Lgrpcode(objgroup_BO);

                
                mxdict = Convert.ToDouble(asnreslt[0]);
                chserices = asnreslt[1];
                txtmaturdt.Text = txtgrpcode.Text = asnreslt[2];
                txtinstlmt.Text = asnreslt[3];

                txtcmpchit.Text = "1";
            }
        }
        #endregion

        /*GROUP REGISTRATION*/
        #region
        void RegtLoad()
        {
            try
            {
                dgvreg.DataSource = objgroup_LA.Groupformt_Regview();
                dgvreg.DataBind();
            }
            catch (Exception ii)
            { Response.Write("Oops! error occured :" + ii.Message.ToString()); }
        }

        void ldchitgroupUnrg()
        {
            try
            {
              /*  DataTable dt;
                dt = objgroup_LA.GroupUnregistr();
                drpgroup.DataSource = dt;
                drpgroup.DataTextField = dt.Columns[0].ToString();
                drpgroup.DataBind();
                drpgroup.Items.Insert(0, new ListItem("Select"));*/

                objgroup_LA.loaddp(drpgroup);
            }
            catch (Exception ii)
            {
                Response.Write("Oops! error occured :" + ii.Message.ToString());
            }
        }
        protected void dgvreg_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvreg.PageIndex = e.NewPageIndex;
            RegtLoad();
        }
        
        #endregion

        protected void drpgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpgroup.SelectedIndex > 0)
            {
                objgreg_BO.ChitGroupCode = drpgroup.SelectedItem.Text;

                double[] Mreslt = new double[2];
                Mreslt = objgroup_LA.GMEFeevalu(objgreg_BO);
                txtmaxdiscnt.Text = Mreslt[0].ToString();
                txtentrancfee.Text = Mreslt[1].ToString();

               /* txtmaxdiscnt.Text = mxdict.ToString();
                txtentrancfee.Text = eefe.ToString();*/
            }
        }

        protected void txtcommdt_TextChanged(object sender, EventArgs e)
        {
            if (txtcommdt.Text.Trim() != "" && drpgroup.SelectedIndex > 0)
            {
                objgreg_BO.CommencDate = txtcommdt.Text;
                objgreg_BO.PsoRegdate = txtpsoregdt.Text;

                bool ttre;
                ttre = objgreg_BO.checkcommdt();
                if (ttre == true)
                {
                    objgreg_BO.ChitGroupCode = drpgroup.SelectedItem.Text;
                    txttermdt.Text = objgroup_LA.LgetTermdate(objgreg_BO);
                }
            }
        }

        protected void btnregsave_Click(object sender, EventArgs e)
        {
            try
            {
                string msgg = "";
                int chk = 0;

                if (drpgroup.SelectedIndex > 0)
                {
                    objgreg_BO.ChitGroupCode = drpgroup.SelectedItem.Text;
                    objgreg_BO.actflgGF = "Y";
                    objgreg_BO.PsoNo = txtpsono.Text.ToUpper();
                    objgreg_BO.PsoRegdate = txtpsoregdt.Text;
                    objgreg_BO.CommencDate = txtcommdt.Text;
                    objgreg_BO.TerimatDate = txttermdt.Text;
                    objgreg_BO.maxdct = Convert.ToDouble(txtmaxdiscnt.Text);
                    objgreg_BO.EnterncFee = Convert.ToDouble(txtentrancfee.Text);
                    
                    chk = objgroup_LA.SaveChitGroupRegist(objgreg_BO);
                    if (chk > 0)
                    {
                        msgg = "Insert Successfully";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "window.onload = function(){ alert('" + msgg + "')};", true);
                        ClearGrpRegrtn();
                       /*ldRegfrm();*/
                    }
                    else
                    {
                        msgg = "Not Inserted.";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "window.onload = function(){ alert('" + msgg + "')};", true);
                    }
                }
            }
            catch (Exception ii)
            {
                Response.Write("Oops! error occured :" + ii.Message.ToString());
            }
            finally
            {
                objgroup_LA = null;
                objgroup_BO = null;
            }
        }
    }
}