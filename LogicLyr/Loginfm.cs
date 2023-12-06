using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Xml;
using System.Web;
using System.Web.UI.WebControls;
using System.Configuration;
using DataLyr;


namespace LogicLyr
{
    public class Loginfm
    {

        backend_master back = new backend_master();
        public int login(string brn, ObjectLyr.ObjectLogin objbo)
        {
            int ab = 0;
            HttpContext.Current.Session["brnc"] = brn;
            back.opn_();
            string chk = back.snocnt(@"select 1 from vwuserinfo WHERE lower(USERID) = '" + objbo.usernm.ToLower() + "' and pass3 = '" + objbo.passwrd + "'");

            if (chk == "" || chk == string.Empty)
                chk = "0";

            if (chk == "1")
            {
                HttpContext.Current.Session["loginid"] = objbo.usernm;
            }
            back.close_();
            ab = Convert.ToInt32(chk);
            return ab;
        }

        
    }
}
