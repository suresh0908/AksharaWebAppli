using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Npgsql;

namespace DataLyr
{
    public class backend_search
    {
        public NpgsqlConnection cn, cnn, cn1;
        NpgsqlCommand cm;
        public NpgsqlDataReader dr;
        NpgsqlDataAdapter da;
        DataSet ds;
        DataTable dtabl = new DataTable();
        public static String lgnuserid, branch, acs_ver = "2.20";
        String sessionID;
        public string connec()
        {
            sessionID = HttpContext.Current.Session["brnc"].ToString();
            string connc = "PORT=5432;TIMEOUT=1024;POOLING=True;MINPOOLSIZE=1;MAXPOOLSIZE=500;COMMANDTIMEOUT=50000;DATABASE=SEARCH;HOST=192.168.1.10;USER ID=postgres;PASSWORD=manager";
            return connc;
            /*string connc = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
             return connc;*/
        }
        public void opn_()
        {
            string conn = connec();
            cn = new NpgsqlConnection(conn);
            cn.Open();
        }
        public void close_()
        {
            cn.Close();
        }
        public void alert(string msgg, Page pg, string typ)
        {
            pg.ClientScript.RegisterStartupScript(this.GetType(), typ,
                "alert('" + msgg + "');", true);
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
        public void writeline(string msg)
        {
            HttpContext.Current.Response.Write(msg);
        }
        public void insert(string qry, string typ)
        {
            try
            {
                cm = new NpgsqlCommand(qry, cn);
                cm.ExecuteNonQuery();
                cm.Dispose();
                if (typ == "e")
                    writeline("Entered Successfully");
                if (typ == "u")
                    writeline("Updated Successfully");
            }
            catch (Exception aa)
            {
                //MessageBox.Show(aa.ToString());
            }
        }

        public string insert_ids(string qry, string typ)
        {
            try
            {
                /* cm = new OleDbCommand(qry, cn);
                 cm.ExecuteNonQuery();
                 return cm.LastInsertedId.ToString();*/

                cm = new NpgsqlCommand(qry, cn);
                if (typ == "e")
                    writeline("Entered Successfully");
                if (typ == "u")
                    writeline("Updated Successfully");
                string ab = "";
                ab = cm.ExecuteScalar().ToString();
                return ab;
            }
            catch (Exception aa)
            {
                return "Error";
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
                writeline(aa.Message);
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
