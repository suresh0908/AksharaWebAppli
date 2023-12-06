using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicLyr;
using ObjectLyr;

namespace AksharaWebAppli.Setup
{
    public partial class frmpersonreg : System.Web.UI.Page
    {
        logicperson lprs = new logicperson();
        LogicBank lbnk = new LogicBank();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // load_person_grid();
            }
        }

        void load_person_grid()
        {
            //dgvperson.DataSource = null;
            //DataTable dt;
            //dt = lprs.get_person();
            //dgvperson.DataSource = dt;
            //dgvperson.DataBind();

        }
        private void clear_contr()
        {
            txtname.Text = string.Empty;
            txtsurname.Text = string.Empty;
            txtfname.Text = string.Empty;
            txtdob.Text = string.Empty;
            txtmobno.Text = string.Empty;
            txtaatherno.Text = string.Empty;
            txtpanno.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtage.Text = string.Empty;

            txtcntdrno.Text = string.Empty;
            txtcntstreet.Text = string.Empty;
            txtcntarea.Text = string.Empty;
            txtcntcity.Text = string.Empty;
            txtcntstate.Text = string.Empty;
            txtcntloc.Text = string.Empty;
            txtcntpincode.Text = string.Empty;

            txtpermdrno.Text = string.Empty;
            txtpermstreet.Text = string.Empty;
            txtpermarea.Text = string.Empty;
            txtpermcity.Text = string.Empty;
            txtpermstate.Text = string.Empty;
            txtpermloc.Text = string.Empty;
            txtpermpincode.Text = string.Empty;
           
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            string regid = "";
            regid = lprs.get_regid();

            Objectperson objpers = new Objectperson();
            

            objpers.regid = regid;
            objpers.name = txtname.Text;
            objpers.surname = txtsurname.Text;
            objpers.fname = txtfname.Text;
            objpers.dob = lbnk.get_mskdt(txtdob.Text);
            if (drdgender.Text == "Male")
                objpers.gender = "M";
            else  if (drdgender.Text == "Female")
                objpers.gender = "F";

            objpers.mobno = txtmobno.Text;
            objpers.aatherno = txtaatherno.Text;
            objpers.panno = txtpanno.Text;
            objpers.email = txtemail.Text;

            if (drdmstatus.Text == "Married")
                objpers.mstatus = "M";
            else if (drdmstatus.Text == "Un Married")
                objpers.mstatus = "U";

            objpers.cntdoorno = txtcntdrno.Text;
            objpers.cntstreet = txtcntstreet.Text;
            objpers.cntarea = txtcntarea.Text;
            objpers.cntcity = txtcntcity.Text;
            objpers.cntstate = txtcntstate.Text;
            objpers.cntcntry = txtcntloc.Text;
            objpers.cntpincode = txtcntpincode.Text;

            objpers.permdoorno = txtpermdrno.Text;
            objpers.permstreet = txtpermstreet.Text;
            objpers.permarea = txtpermarea.Text;
            objpers.permcity = txtpermcity.Text;
            objpers.permstate = txtcntstate.Text;
            objpers.permcntry = txtpermloc.Text;
            objpers.permpincode = txtpermpincode.Text;

            lprs.insert_kyc(objpers);
            load_person_grid();
            clear_contr();
        }

        protected void txtdob_TextChanged(object sender, EventArgs e)
        {
            try
            {
                txtage.Text = string.Empty;
                DateTime dob;
                dob = lbnk.get_mskdt(txtdob.Text);
                int age = (int)((DateTime.Now - dob).TotalDays / 365.242199);
                txtage.Text = age.ToString();
            }
            catch { }
        }
    }
}