using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Configuration;
using LogicLyr;
using ObjectLyr;

namespace AksharaWebAppli.Setup
{
    public partial class FrmSecuty : System.Web.UI.Page
    {
        LogicFdrSecurity Lgcfdr = new LogicFdrSecurity();
        Logiccommon lgccmmn = new Logiccommon();
        public int brnch = 0;
        String acdy = "", entry_dt = "", pyrcpt = "";
        DateTime fdate, mdate;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["id"] != null)
            //    txtid.Text = Request.QueryString["id"].ToString();
            /*indian date*/
           GetIndiaDate();
            if (!IsPostBack)
            {
                ldfrm();
            }
        }

        void ldfrm()
        {
            DgvlLoad();
            MortDgvload();
            perid();
            txtfdrdat.Text = Convert.ToDateTime(entry_dt).ToString("dd/MM/yyyy");
            txtmaturdt.Text = Convert.ToDateTime(entry_dt).ToString("dd/MM/yyyy");
        }
        void perid()
        {
            ddpperiod.Items.Clear();
            for (int i = 0; i < 56; i++)
            {
                ddpperiod.Items.Add(i.ToString());
            }
            ddpperiod.SelectedIndex = 0;
        }
        void GetIndiaDate()
        {
            TimeZoneInfo Ind_dat = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime dat = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, Ind_dat);
            entry_dt = Convert.ToDateTime(dat).ToString("yyyy/MM/dd hh:mm:ss");
        }

        void DgvlLoad()
        {
            try
            {
                dgvfdr.DataSource = Lgcfdr.Fdrview();
                dgvfdr.DataBind();
            }
            catch (Exception ii)
            { Response.Write("<script>alert('" + ii.ToString() + "')</script>"); }
        }

        void MortDgvload()
        {
            try
            {
                dgvmort.DataSource = Lgcfdr.MOrtgview();
                dgvmort.DataBind();
            }
            catch (Exception ii)
            { Response.Write("<script>alert('" + ii.ToString() + "')</script>"); }
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
                ObjectSecutry objfdr = new ObjectSecutry();
                objfdr.Fdrsecurtyno = txtsecurtyno.Text;
                objfdr.Fdrvalue = Convert.ToDouble(txtvalue_sec.Text);
                objfdr.Fdrdate = txtfdrdat.Text;
                objfdr.Fdrmaturdate = txtmaturdt.Text;

                objfdr.Fdrbank = txtbanknm.Text.ToUpper();
                objfdr.Fdrbankbranch = txtbnkbrn_sec.Text.ToUpper();
                objfdr.Fdrintrate = txtinstrate_sec.Text;
                objfdr.Fdrintmode = ddpinterstmode.SelectedItem.Text.ToUpper();
                objfdr.Fdractflag = "Y";

                chk = Lgcfdr.FdrInsert(objfdr);
                if (chk == 1)
                {
                    msgg = "Insert Successfully";
                    Response.Write("<script>alert('" + msgg + "')</script>");
                    clear_sec();
                    ldfrm();
                }
                else
                {
                    msgg = "This FDR A/C No Doesnot / Already Exits...";
                    Response.Write("<script>alert('" + msgg + "')</script>");
                    txtsecurtyno.Text = string.Empty;
                    txtsecurtyno.Focus();
                }
            }
            catch (Exception ii)
            {
                Response.Write("<script>alert('" + ii.ToString() + "')</script>");
            }
        }
        void clear_sec()
        {
            txtsecurtyno.Text = string.Empty;
            txtvalue_sec.Text = string.Empty;
            txtinstrate_sec.Text = string.Empty;
            txtbanknm.Text = string.Empty;
            txtbnkbrn_sec.Text = string.Empty;
            ddpinterstmode.SelectedIndex = 0;
            
        }
        protected void ddpperiod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddpperiod.SelectedIndex >0)
            {
                fdate = Convert.ToDateTime(lgccmmn.mskdt_(txtfdrdat.Text));
                int fmnths = 0;
                fmnths = Convert.ToInt32(ddpperiod.SelectedValue);
                mdate = fdate.AddMonths(fmnths);
                txtmaturdt.Text = Convert.ToDateTime(mdate).ToString("dd/MM/yyyy");
            }
        }
    }
}