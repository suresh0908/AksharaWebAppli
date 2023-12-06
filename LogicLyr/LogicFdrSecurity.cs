using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataLyr;
using ObjectLyr;


namespace LogicLyr
{
    public class LogicFdrSecurity
    {
        backend_master back = new backend_master();
        public DataTable Fdrview()
        {
            string today = DateTime.Now.ToString("yyyy/MM/dd");
            DataTable dt;
            back.opn_();
            dt = back.get_table(@"select fxddepvalue,to_char(fxddepdt,'dd/MM/yyyy') as fxddt,to_char(fxddepmatdt,'dd/MM/yyyy') as fxdmrtdt,fxddepbank,fxddepbankbranch,fxddepno from tabgroupfxddep  where to_char(fxddepmatdt,'yyyy/MM/dd')>='" + today + "'");
            back.close_();
            return dt;
        }
        public DataTable MOrtgview()
        {
            DataTable dt;
            back.opn_();
            dt = back.get_table(@"select (case when mortdealvalue>=1000000 then to_char(mortdealvalue::float, 'FM99,FM99,99,999') else to_char(mortdealvalue::float,'FM9,99,999') end) as mortvlu,to_char(mortdt,'dd/MM/yyyy') as mordt,concat('This ',mortpropdesc,' Belongs To ',mortpropownname,'. The Property Details are : ',mortregdist,' , ',mortsubdist) as detls,mortdealno from tabgroupmort order by mortdt");
            back.close_();
            return dt;
        }
        public int FdrInsert(ObjectLyr.ObjectSecutry objfdr)
        {
            int zz = 0;
            try
            {
                back.opn_();
                string chk = "";
                chk = back.snocnt("select 1 from tabgroupfxddep where fxddepno='" + objfdr.Fdrsecurtyno + "'");

                if (chk != "1")
                {
                    string fdrdt = back.mskdt_(objfdr.Fdrdate);
                    string maturdt = back.mskdt_(objfdr.Fdrmaturdate);

                    string qry = @"insert into tabgroupfxddep values ('" + objfdr.Fdrsecurtyno + "'," + objfdr.Fdrvalue + ",'" + fdrdt + "','" + maturdt + "','" + objfdr.Fdrbank + "','" + objfdr.Fdrbankbranch + "','" + objfdr.Fdrintrate  + "','" + objfdr.Fdrintmode + "','"+objfdr.Fdractflag +"');";
                   back.insert(qry, "");
                   zz = 1;
                }
                else
                {
                    zz = 0;
                }
                back.close_();
            }
            catch
            {
                zz = 0;
            }
            return zz;
        }
    }
}
