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
    public class LogicBank
    {
        backend_master back = new backend_master();
        public DataTable get_bankdata()
        {
            DataTable dt;
            back.opn_();
            dt = back.get_table("select vchbankid,vchaccname,vchbankname,vchbankbranch,vchaccno,numoverdraft from tabbanksetup where vchstatus = 'Y'");
            back.close_();
            return dt;
        }
        public DataTable get_bankdetails(ObjectBank objbnk)
        {
            DataTable dt;
            back.opn_();
            dt = back.get_table("SELECT bs.vchbankid AS bankid,bs.vchbankname AS bankname,bs.vchbankbranch AS bankbranch,bs.vchaccname AS accname,bs.vchaccno AS accno,bs.vchbrn AS brn,to_char(bs.datbrndate,'dd/MM/yyyy') AS brndate,bs.numoverdraft AS overdraft,bs.vchifccode AS vchifccode,bs.bnkemialid,bs.bnkmobno, bs.bnklandno, bs.bnkactyp,bs.upi1,bs.upi2, ba.vchdoorno AS doorno,ba.vchstreet AS street,ba.vcharea AS area,ba.vchcity AS city,ba.vchstate AS state,ba.vchcountry AS country, ba.vchpincode AS pincode FROM tabbankaddress ba  RIGHT JOIN tabbanksetup bs ON ba.vchbankid::text = bs.vchbankid::text where bs.vchbankid='" + objbnk.bankaccid + "'");
            back.close_();
            return dt;
        }
        public List<string> get_state(string prefixText)
        {
            List<string> state = new List<string>();
            DataTable dt;
            back.opn_();
            dt = back.get_table("select distinct vchstate From tabbankaddress where vchstate like '" + prefixText + "%'");
            back.close_();
            foreach(DataRow dr in dt.Rows)
            {
                state.Add(dr[0].ToString());
            }
            return state;
        }
        public DateTime get_mskdt(string date)
        {
            DateTime date1;
            date1 = Convert.ToDateTime(back.mskdt_(date));
            return date1;
        }

        public void insert_bnk(ObjectBank objbnk)
        {
            back.opn_();
            string lgname = HttpContext.Current.Session["loginid"].ToString();
            back.insert("insert into tabbanksetup values ('" + objbnk.bankaccid + "','" + objbnk.bankname + "','" + objbnk.bankbranch + "','" + objbnk.bankaccname + "','" + objbnk.accountno + "','" + objbnk.vchbrn + "','" + objbnk.brndate.ToString("yyyy-MM-dd") + "',now(),'" + objbnk.overdrft + "','" + lgname + "',now(),'" + objbnk.bnkifccode + "','" + objbnk.bnkemail + "','" + objbnk.bnkmobno + "','" + objbnk.bnklandno + "','" + objbnk.bnkactyp + "','Y','" + objbnk.bnkorder + "','" + objbnk.bnkupi1 + "','" + objbnk.bnkupi2 + "')", "");
            back.insert("INSERT INTO tabbankaddress VALUES ('" + objbnk.bankaccid + "','" + objbnk.bnkorder + "','" + objbnk.bnkstreet + "','" + objbnk.bnkarea + "','" + objbnk.bnkcity + "','" + objbnk.bnkstate + "','" + objbnk.bnkcntry + "','" + objbnk.bnkpincode + "','" + lgname + "',now())", "");
            back.close_();

        }
        public void update_bnk(ObjectBank objbnk)
        {
            back.opn_();
            string lgname = HttpContext.Current.Session["loginid"].ToString();
           
           
            back.insert("update  tabbanksetup set  vchbankname='" + objbnk.bankname + "',vchbankbranch='" + objbnk.bankbranch + "',vchaccname='" + objbnk.bankaccname + "',vchaccno='" + objbnk.accountno + "',vchbrn='" + objbnk.vchbrn + "',datbrndate='" + objbnk.brndate.ToString("yyyy-MM-dd") + "',numoverdraft='" + objbnk.overdrft + "',vchifccode='" + objbnk.bnkifccode + "',bnkemialid='" + objbnk.bnkemail + "',bnkmobno='" + objbnk.bnkmobno + "',bnklandno='" + objbnk.bnklandno + "', bnkactyp ='" + objbnk.bnkactyp + "',ord_bnk='" + objbnk.bnkorder + "',upi1='" + objbnk.bnkupi1 + "',upi2='" + objbnk.bnkupi2 + "' where vchbankid='" + objbnk.bankaccid + "'", "");

            back.insert("update tabbankaddress set vchdoorno='" + objbnk.bnkorder + "',vchstreet='" + objbnk.bnkstreet + "',vcharea='" + objbnk.bnkarea + "',vchcity='" + objbnk.bnkcity + "',vchstate='" + objbnk.bnkstate + "',vchcountry='" + objbnk.bnkcntry + "',vchpincode='" + objbnk.bnkpincode + "'  where vchbankid='" + objbnk.bankaccid + "' ", "");

            back.close_();

        }
        
    }
}
