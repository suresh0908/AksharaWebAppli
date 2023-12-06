using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLyr;
using System.Data;

namespace LogicLyr
{
    public class LogicSubcat
    {
        backend_master back = new backend_master();

        public DataTable loadacchead()
        {
            back.opn_();
            DataTable dt;
            dt = back.get_table("select vchaccid,vchaccname From tabaccounttree where chracctype='2' order by vchaccname");
            back.close_();
            return dt;
        }
        public DataTable load_subcat(ObjectLyr.ObjectSubcat objsubcat)
        {
            DataTable dt;
            back.opn_();
            dt = back.get_table("select vchaccname From tabaccounttree where vchparentaccname='"+objsubcat.paccname+"' order by vchaccname");
            back.close_();
            return dt;
        }
        public string insertsubcat(ObjectLyr.ObjectSubcat objsubcat)
        {
            string accid = "";
            try
            {
                back.opn_();
               accid = back.snocnt("select insertaccounts('" + objsubcat.accname + "', '" + objsubcat.paccid + "', '3')");
                back.close_();
               
            }
            catch { }
            return accid;
        }
        public string get_accid(string accname,string acctyp)
        {
            string accid = "";
            back.opn_();
            accid = back.snocnt("select vchaccid From tabaccounttree where vchaccname='" + accname + "' and chracctype='" + acctyp + "'");
            back.close_();
            return accid;
        }
        public string insertacchead(ObjectLyr.ObjectSubcat objsubcat)
        {
            string accid = "";
            try
            {
                back.opn_();
                accid = back.snocnt("select insertaccountheads('" + objsubcat.accname + "', '" + objsubcat.paccid + "', '2')");
                back.close_();
                
            }
            catch { }
            return accid;
        }

    }
}
