using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataLyr;
using ObjectLyr;
using System.Web;

namespace LogicLyr
{
   public class logicperson
    {
        backend_search back_s = new backend_search();

        public DataTable get_person()
        {
            DataTable dt;
            back_s.opn_();
            dt = back_s.get_table("select regid,name,surname,mobileno,aatherno from tabpersonreg order by regid");
            back_s.close_();
            return dt;
        }
       public string get_regid()
        {
            string id = "";
            back_s.opn_();
            id = back_s.snocnt("select 'AK000'||(COALESCE(max(id::int),'0')+1)::text from (select substring(regid,3) as id from tabpersonreg)a");
            back_s.close_();
            return id;
        }

       public void insert_kyc(Objectperson objpers)
        {

            back_s.opn_();
            back_s.insert("insert into tabpersonreg values('" + objpers.regid + "','" + objpers.name + "','" + objpers.surname + "','" + objpers.fname + "','" + objpers.dob.ToString("yyyy-MM-dd") + "','" + objpers.gender + "','" + objpers.mobno + "','" + objpers.panno + "','" + objpers.email + "','" + objpers.mstatus + "','" + objpers.aatherno + "','Y')", "");

            back_s.insert("insert into tabpersonaddress values('" + objpers.regid + "','" + objpers.cntdoorno + "','" + objpers.cntstreet + "','" + objpers.cntarea + "','" + objpers.cntcity + "','" + objpers.cntstate + "','" + objpers.cntcntry + "','" + objpers.cntpincode + "','CON')", "");

            back_s.insert("insert into tabpersonaddress values('" + objpers.regid + "','" + objpers.permdoorno + "','" + objpers.permstreet + "','" + objpers.permarea + "','" + objpers.permcity + "','" + objpers.permstate + "','" + objpers.permcntry + "','" + objpers.permpincode + "','PER')", "");

            back_s.close_();
        }

    }
}
