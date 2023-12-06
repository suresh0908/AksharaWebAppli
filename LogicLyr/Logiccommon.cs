using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;

namespace LogicLyr
{
    public class Logiccommon
    {
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
        public void alert(string msgg, Page pg, string typ)
        {
            pg.ClientScript.RegisterStartupScript(this.GetType(), typ,
                "alert('" + msgg + "');", true);
        }
    }
}
