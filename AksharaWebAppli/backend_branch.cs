using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI.HtmlControls;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace AksharaWebAppli
{
    public class backend_branch
    {
        SqlConnection sqlcn;
        SqlCommand sqlcmd;
        SqlDataReader sqldr;
        SqlDataAdapter sqladp;

        public NpgsqlConnection cn, cnn, cn1;
        NpgsqlCommand cm;
        public NpgsqlDataReader dr;
        NpgsqlDataAdapter da;
        DataSet ds;
        DataTable dtabl = new DataTable();
        public static String lgnuserid, branch, acs_ver = "2.20";
        String sessionID;

        public static int entry_color_value, comper = 5, frmflg, insertflg;
        public static String my_path = "D:\\", remote_ipaddr = "97.74.81.182", ipaddr = "184.168.224.163", title = "Akshara Chit Solution", temp_path = "C:\\WINDOWS", login_usr = "aksharait", err, branch_s, val = "";
        public static int extflag, auctday, brnlen, nm, efee, missing_flg, update_flg;
        public static int value, abmvalue, marketing, mprdwld;
        public static String application_path, branchcode, aaa, sft, brn = "brn", collection = "COLLECTION";
        public static String login_pwd = "Vjyh309@";

        public static String dno, street, city, district, pincode, phone, company, TmpAMS, pettycashbranch, gstno ;
        public static String mon, state, trgrptkt;
        public static int month, year, days, prev_month, picflg;
        public static String mobiletrno, banl, bankbranch, chequeno, chequedt, paymode;
        public static Double mobiletramt, pt_amt, debitcharges;
        public static String mobile_grpcode, mobile_ticketno;
        public static string myIP, swipeid, bankname;
        public static Double cper1, cper2, dper1, dper2, swipeamount, swipecharges, swppert = 2.5, T_gst = 18;
        public static string userid = "";
        public static string usrpwd = "";
        public static string sqlconn;
        public static string swipingchargesaccid, swipeonhandaccid;
        public static string bankstr, trchqbank, trchqbranch, trchqno, trchqdt, trrrcode, trcard, interbranchaccid, vchaccid, qrcode;
       
        public string connec()
        {
            sessionID = HttpContext.Current.Session["brnc"].ToString();
            string connc = "PORT=5432;TIMEOUT=1024;POOLING=True;MINPOOLSIZE=1;MAXPOOLSIZE=500;COMMANDTIMEOUT=50000;DATABASE=" + sessionID + ";HOST=192.168.1.10;USER ID=postgres;PASSWORD=manager";
            return connc;
           /* string connc = ConfigurationManager.ConnectionStrings["constr"].ConnectionString.Replace("", "");
            return connc;*/
        }
        public void writeline(string msg)
        {
            HttpContext.Current.Response.Write(msg);
        }
        public void opn_()
        {
            string conn = connec();
            cn = new NpgsqlConnection(conn);
            cn.Open();
        }
        public void alert(string msgg, Page pg, string typ)
        {
            pg.ClientScript.RegisterStartupScript(this.GetType(), typ,
                "alert('" + msgg + "');", true);
        }
        public string MINS_HOURS(string tim)
        {
            string vlu = "";
            try
            {
                Double dur_tim = 0;
                Double tmp = 0;
                dur_tim = Convert.ToDouble(tim);
                if (dur_tim > 0)
                {
                    tmp = dur_tim / 60;
                    tmp = Math.Round(tmp, 2);
                    string[] fields = tmp.ToString().Split(new string[] { "." }, StringSplitOptions.RemoveEmptyEntries);
                    Double temp2 = Convert.ToDouble(fields[1]);
                    Double temp3 = Convert.ToDouble(fields[0]);
                    int len1 = 0;
                    len1 = temp2.ToString().Length;

                    if (len1 == 1)
                        temp2 = temp2 * 0.1;
                    else
                        temp2 = temp2 * 0.01;

                    temp2 = temp2 * 60;
                    temp2 = Math.Round(temp2, 0);
                    int len = temp2.ToString().Length;
                    if (len == 1)
                        vlu = temp3.ToString() + ":0" + temp2.ToString();
                    else
                        vlu = temp3.ToString() + ":" + temp2.ToString();
                }
                else
                { vlu = "00:00"; }
            }
            catch { }
            return vlu;
        }

        public double round(double amt)
        {
            decimal aa = 0;
            aa = Math.Round(Convert.ToDecimal(amt), 2);
            return Convert.ToDouble(aa);
        }
        public void alert(string msgg)
        {

        }

        public void trans(string[] qry, int len)
        {
            NpgsqlConnection cnn = new NpgsqlConnection(connec());
            cnn.Open();
            NpgsqlTransaction t = cnn.BeginTransaction();
            try
            {
                for (int i = 0; i < len; i++)
                {
                    NpgsqlCommand cm = new NpgsqlCommand(qry[i], cnn, t);
                    cm.ExecuteNonQuery();
                }
                t.Commit();
                msg("Entered Succesfully");
            }
            catch (Exception aa)
            {
                t.Rollback();
                msg("Your Transaction Rolled Back..");
                msg(aa.Message);
            }
        }

        public void close_()
        {
            cn.Close();
        }
        public void msg(string msgg)
        {

        }
        public NpgsqlDataReader reader(string qry)
        {
            cm = new NpgsqlCommand(qry, cn);
            dr = cm.ExecuteReader();

            return dr;
        }
        public string mskdt_(string dt)
        {
            if (dt.Contains("/"))
            {
                string[] arr = dt.Split('/');
                string dtt = arr[2] + "-" + arr[1] + "-" + arr[0];
                return dtt;
            }
            else
            {
                string[] arr = dt.Split('-');
                string dtt = arr[2] + "-" + arr[1] + "-" + arr[0];
                return dtt;
            }
        }
       /* public void load_append(string qry, TextBox txt)
        {
            try
            {
                DataTable dt1 = new DataTable();
                dt1 = get_table(qry);
                AutoCompleteStringCollection mycoll1 = new AutoCompleteStringCollection();
                foreach (DataRow dr1 in dt1.Rows)
                {
                    mycoll1.Add(dr1[0].ToString());
                }
                txt.AutoCompleteCustomSource = mycoll1;
            }
            catch (Exception aa)
            { msg(aa.Message); }
        }*/
        
        public void insert(string qry, string typ)
        {
            try
            {
                cm = new NpgsqlCommand(qry, cn);
                cm.ExecuteNonQuery();
                cm.Dispose();
                if (typ == "e")
                    msg("Entered Successfully");
                if (typ == "u")
                    msg("Updated Successfully");
            }
            catch (Exception aa)
            {
                //MessageBox.Show(aa.ToString());
            }
        }

        public void insert_creat(string qry, string typ)
        {
            try
            {
                cm = new NpgsqlCommand(qry, cn);
                cm.ExecuteNonQuery();
                cm.Dispose();
                if (typ == "e")
                    msg("Entered Successfully");
                if (typ == "u")
                    msg("Updated Successfully");
            }
            catch
            {

            }
        }

        public string scalar(string qry)
        {
            try
            {
                string aa = "";
                cm = new NpgsqlCommand(qry, cn);
                aa = cm.ExecuteScalar().ToString();
                return aa;
            }
            catch (Exception ex) { return null; }
        }
        public string snocnt(string qry)
        {
            string aa = "";
            try
            {
                cm = new NpgsqlCommand(qry, cn);
                dr = cm.ExecuteReader();
                while (dr.Read())
                    aa = dr[0].ToString();
                dr.Close();
                return aa;
            }
            catch { return aa; }
        }
        public void load_grid(string qry, GridView dgv)
        {
            try
            {
                cm = new NpgsqlCommand(qry, cn);
                da = new NpgsqlDataAdapter(cm);
                ds = new DataSet();
                da.Fill(ds);
                dgv.DataSource = ds.Tables[0];
                dgv.DataBind();
            }
            catch (Exception aa)
            {
                msg(aa.Message);
            }
        }
        public DataTable get_table(string qry)
        {
            cm = new NpgsqlCommand(qry, cn);
            da = new NpgsqlDataAdapter(cm);
            ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            return dt;
        }
        public void load(string qry, DropDownList txt, string fst, string secnd_value)
        {
            txt.Items.Clear();

            cm = new NpgsqlCommand(qry, cn);
            da = new NpgsqlDataAdapter(cm);
            ds = new DataSet();
            da.Fill(ds);

            txt.DataSource = ds;
            txt.DataTextField = secnd_value;
            txt.DataBind();
            txt.Items.Insert(0, new ListItem(fst));
        }
    }
}