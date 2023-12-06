using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LogicLyr;
using ObjectLyr;

namespace AksharaWebAppli.Setup
{
    public partial class FrmBank : System.Web.UI.Page
    {
        LogicBank lbnk = new LogicBank();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_banks_grid();
            }
        }
        void load_banks_grid()
        {
            dgvbnk.DataSource = null;
            DataTable dt;
            dt = lbnk.get_bankdata();
            dgvbnk.DataSource = dt;
            dgvbnk.DataBind();
           
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> load_state(string prefixText)
        {
            List<string> state = new List<string>();
           // state = lbnk.get_state(prefixText);
            state.Add("Telanagana");
            state.Add("Andhrapradesh");
            
            return state;
        }

        void clear_all()
        {
            txtbrno.Text = string.Empty;
            txtbrndate.Text = string.Empty;
            txtaccname.Text = string.Empty;
            txtbnknm.Text = string.Empty;
            txtbnkbrnch.Text = string.Empty;
            drdactyp.SelectedIndex = 0;
            txtaccno.Text = string.Empty;
            txtovrdrft.Text = string.Empty;
            txtbnkifc.Text = string.Empty;
            txtupi1.Text = string.Empty;
            txtupi2.Text = string.Empty;
            txtmobno.Text = string.Empty;
            txtlndno.Text = string.Empty;
            txtemail.Text = string.Empty;

            txtdrno.Text = string.Empty;
            txtstreet.Text = string.Empty;
            txtarea.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtstate.Text = string.Empty;
            txtloc.Text = string.Empty;
            txtpincode.Text = string.Empty;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            
            string vchbnkid = "";
            LogicSubcat lsubcat = new LogicSubcat();
            vchbnkid = lsubcat.get_accid("BANKS", "1");
            ObjectSubcat obj = new ObjectSubcat();
            obj.accname =txtaccname.Text.Trim();
            obj.paccid = vchbnkid;
            vchbnkid = lsubcat.insertacchead(obj);
            ObjectBank objbnk = new ObjectBank();

            objbnk.bankaccid = vchbnkid;
            objbnk.bankaccname = txtaccname.Text.Trim();
            objbnk.bankname = txtbnknm.Text;
            objbnk.vchbrn = txtbrno.Text;
            objbnk.brndate = lbnk.get_mskdt(txtbrndate.Text);
            objbnk.bnkactyp = drdactyp.SelectedItem.ToString();
            objbnk.bnkorder = drdactyp.SelectedIndex.ToString();
            objbnk.bankbranch = txtbnkbrnch.Text;
            objbnk.accountno = txtaccno.Text;
            objbnk.overdrft = Convert.ToDouble(txtovrdrft.Text);
            objbnk.bnkifccode = txtbnkifc.Text;
            objbnk.bnkupi1 = txtupi1.Text;
            objbnk.bnkupi2 = txtupi2.Text;
            objbnk.bnkmobno = txtmobno.Text;
            objbnk.bnklandno = txtlndno.Text;
            objbnk.bnkemail = txtemail.Text;

            objbnk.bankdoorno = txtdrno.Text;
            objbnk.bnkstreet = txtstreet.Text;
            objbnk.bnkarea = txtarea.Text;
            objbnk.bnkcity = txtcity.Text;
            objbnk.bnkstate = txtstate.Text;
            objbnk.bnkcntry = txtloc.Text;
            objbnk.bnkpincode = txtpincode.Text;

            if (btnsave.Text == "Update")
            {
                lbnk.update_bnk(objbnk);
                dgvbnk.SelectedRowStyle.Font.Bold = false;
                dgvbnk.SelectedRowStyle.Reset();
            }
            else if (btnsave.Text == "Save")
            {
                lbnk.insert_bnk(objbnk);
            }
           
            clear_all();
            btnsave.Text = "Save";
            load_banks_grid();
        }

        protected void dgvbnk_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = dgvbnk.Rows[rowIndex];

                //Fetch value of Name.
                string bankid = (row.FindControl("lblbnkid") as Label).Text;
                load_bankdtls(bankid);

            }
        }
        void load_bankdtls(string bankid)
        {
            ObjectBank objbnk = new ObjectBank();
            objbnk.bankaccid = bankid;
            DataTable dt;
            dt = lbnk.get_bankdetails(objbnk);
            foreach(DataRow dr in dt.Rows)
            {
                txtbnknm.Text = dr[1].ToString();
                txtaccname.Text = dr[3].ToString();
                txtbnkbrnch.Text = dr[2].ToString();
                txtaccno.Text = dr[4].ToString();
                txtbrno.Text = dr[5].ToString();
                txtbrndate.Text = dr[6].ToString();
                txtovrdrft.Text = dr[7].ToString();
                txtbnkifc.Text = dr[8].ToString();
                txtemail.Text = dr[9].ToString();
                txtmobno.Text = dr[10].ToString();
                txtlndno.Text = dr[11].ToString();
                drdactyp.Text = dr[12].ToString();
                txtupi1.Text = dr[13].ToString();
                txtupi2.Text = dr[14].ToString();

                txtdrno.Text = dr[15].ToString();
                txtstreet.Text = dr[16].ToString();
                txtarea.Text = dr[17].ToString();
                txtcity.Text = dr[18].ToString();
                txtstate.Text = dr[19].ToString();
                txtloc.Text = dr[20].ToString();
                txtpincode.Text = dr[21].ToString();
                btnsave.Text = "Update";
            }
        }

        protected void dgvbnk_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvbnk.PageIndex = e.NewPageIndex;
            load_banks_grid();
        }
    }
}