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
    public partial class FrmLogin : System.Web.UI.Page
    {
        backend_Search back_sh = new backend_Search();
        backend_branch back_br = new backend_branch();
        String brnc = "";
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

        private void Changedatabasename(string name)
        {
            bool isbool = false;
            string path = Server.MapPath("~/Web.Config");
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            XmlNodeList list = doc.DocumentElement.SelectNodes("connectionStrings/add[@name='constr']");
            XmlNode node;
            isbool = list.Count == 0;
            if (isbool)
            {
                node = doc.CreateNode(XmlNodeType.Element, "add", null);
                XmlAttribute attribute = doc.CreateAttribute("name");
                attribute.Value = "constr";
                node.Attributes.Append(attribute);

                attribute = doc.CreateAttribute("connectionString");
                attribute.Value = " ";
                node.Attributes.Append(attribute);

                attribute = doc.CreateAttribute("providerName");
                attribute.Value = "Npgsql";
                node.Attributes.Append(attribute);
            }
            else
            {
                node = list[0];
            }
            string ConctionString = node.Attributes["connectionString"].Value;
            NpgsqlConnectionStringBuilder conStringBuilder = new NpgsqlConnectionStringBuilder(ConctionString);
            conStringBuilder.Host = "192.168.1.10";
            conStringBuilder.Database = ddpchangedb.SelectedValue;
            conStringBuilder.UserName = "postgres";
            string authr = "manager";

            /*byte[] spawrd = System.Text.Encoding.ASCII.GetBytes(authr);
            conStringBuilder.Password ="manager" ;*/
            conStringBuilder.IntegratedSecurity = false;
            
            
           
           
            node.Attributes["connectionString"].Value = conStringBuilder.ConnectionString;
            if (isbool)
            {
                doc.DocumentElement.SelectNodes("connectionString")[0].AppendChild(node);
            }
            doc.Save(path);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           /* Changedatabasename("connectionString");*/
            Session["brnc"] = ddpchangedb.SelectedValue;
            Response.Redirect("~/Setup/FrmSecuty.aspx");
        }  
    }
}