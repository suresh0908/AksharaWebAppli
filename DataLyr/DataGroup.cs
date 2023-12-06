using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web.UI.WebControls;
using ObjectLyr;
namespace DataLyr
{
    public class DataGroup
    {
        backend_master back = new backend_master();

        /*Group Formation*/
        #region
        public object GroupUNregDetails()
        {
            DataTable dt;
            try
            {
                back.opn_();
               dt=back.get_table(@"select prdduration,(case when value>=1000000 then to_char(value::float, 'FM99,FM99,99,999') else to_char(value::float,'FM9,99,999') end) as amts,companychit,status,grpcode from tabchitgroup a,tabchitvalue b,tabchitperiod c where a.prdcode=c.prdcode and a.valuecode=b.valuecode and status='UN REGISTERED';");
                back.close_();
            }
            catch (Exception ii)
            { throw; }

            return dt;
        }
       
        public DataTable Chitperiod()
        {
            DataTable dt;
            try
            {
                back.opn_();
                dt = back.get_table(@"select prdcode,prdduration from tabchitperiod order by totmembers;");
                back.close_();
            }
            catch (Exception ii)
            { throw; }

            return dt;
        }
        public DataTable ChitGrpValue()
        {
            DataTable dt;
            try
            {
                back.opn_();
                dt = back.get_table(@"select valuecode,(case when value>=1000000 then to_char(value::float, 'FM99,FM99,99,999') else to_char(value::float,'FM9,99,999') end) from tabchitvalue order by value;");
                back.close_();
            }
            catch (Exception ii)
            { throw; }

            return dt;
        }
        public DataTable FormenconValue()
        {
            DataTable dt;
            try
            {
                back.opn_();
                dt = back.get_table(@"select FCID,numcmnper from TABFORMENCMNstructure order by FCID");
                back.close_();
            }
            catch (Exception ii)
            { throw; }

            return dt;
        }
        public DataTable GautoExtr(string ssnam)
        {
            DataTable dt;
            try
            {
                back.opn_();
                dt = back.get_table(@"select distinct mailingname from tabsubsmst where mailingname like '" + ssnam + "%'");
                back.close_();
            }
            catch (Exception ii)
            { throw; }

            return dt;
        }
        public int GroupFormInsert(ObjectGroup objGrup)
        {
            int zz = 0;
            try
            {
                back.opn_();
                string chk = "";
                chk = back.snocnt("select 1 from tabchitgroup where grpcode='" + objGrup.ChitGroupCode + "'");

                if (chk != "1")
                {

                    string qry = @"insert into tabchitgroup values ('" + objGrup.ChitGroupCode + "',(SELECT BRID FROM TABBRANCH),'" + objGrup.ChitPeriodvalcode + "','" + objGrup.Chitvalucode + "','Y','" + objGrup.chitgrpseries + "','" + objGrup.ChitgrpStatus + "','" + objGrup.actflgGF + "','" + objGrup.ChitPeriodval + "','" + objGrup.FormenCommis + "');";
                    back.insert(qry, "");
                   zz=1;
                }
                back.close_();
            }
            catch
            {
                zz = 0;
            }
            return zz;
        }
        public string[] GetGropcode(ObjectGroup objGrup)
        {
            string[] minMax =new string[4];

            objGrup.totnum = objGrup.val = objGrup.instm = 0;
            back.opn_();
            DataTable dt1 = new DataTable();
            dt1 = back.get_table("select prdcode,totmembers,maxdiscount from tabchitperiod where prdduration='" + objGrup.ChitPeriod + "'");

            foreach (DataRow dr in dt1.Rows)
            {
                objGrup.percd = dr[0].ToString();
                objGrup.totnum = Convert.ToInt32(dr[1].ToString());
                minMax[0] = dr[2].ToString();
            }

            DataTable dt2 = new DataTable();
            dt2 = back.get_table("select valuecode,value::float from tabchitvalue where valuecode='" + objGrup.Chitvalucode + "'");

            foreach (DataRow dr1 in dt2.Rows)
            {
                objGrup.vlcd = dr1[0].ToString();
                objGrup.val = Convert.ToInt32(dr1[1].ToString());
            }

            objGrup.brcode = back.snocnt(@"SELECT BRID FROM TABBRANCH");
            string org_grpcode = back.snocnt(@"select generatechitseries('" + objGrup.brcode + "', '" + objGrup.percd + "', '" + objGrup.vlcd + "')");

            string str = "",str34="";

            str = back.snocnt(@"SELECT SPLIT_PART('" + org_grpcode + "','^',1)");
            str34 = back.snocnt(@"SELECT SPLIT_PART('" + org_grpcode + "','^',2)");
            back.close_();

            minMax[1] = str34;
            minMax[2] = str;

            objGrup.instm = objGrup.GetInstalment();
            minMax[3] = "Rs. " + objGrup.instm.ToString() + " /-";

            return minMax;
        }
        #endregion
        public void Binddropdown(DropDownList dl)
        {
            try
            {
                back.opn_();
                back.load(@"select grpcode from tabchitgroup where status='UN REGISTERED';", dl, "Select", "grpcode");
                back.close_();
            }
            catch
            { }
        }

        public void DrpdnldID(DropDownList dl)
        {
            try
            {
                back.opn_();
                back.load_dropid(@"select prdcode,prdduration from tabchitperiod order by totmembers;", dl, "Select", "prdduration", "prdcode");
                back.close_();
            }
            catch
            { }
        }

        /*Group Registration*/

        #region
        public DataTable GroupFormat_reged()
        {
            DataTable dt;
            try
            {
                back.opn_();
                dt = back.get_table(@"select a.grpcode as grcode,grblno,to_char(grregdt,'dd/MM/yyyy') as regdt,to_char(grcomdt,'dd/MM/yyyy') as commdt,to_char(grterdt,'dd/MM/yyyy') as termdt,grdividend from tabgroupreg a,tabchitgroup b where a.grpcode=b.grpcode and b.status='REGISTERED';");
                back.close_();
            }
            catch (Exception ii)
            { throw; }
            return dt;
        }

        public DataTable ChitGroupUnreg()
        {
            DataTable dt;
            try
            {
                back.opn_();
                dt = back.get_table(@"select grpcode from tabchitgroup where status='UN REGISTERED';");
                back.close_();
            }
            catch (Exception ii)
            { throw; }

            return dt;
        }

        public double[] GetGrpMaxEfee(ObjectRegi objreg)
        {
            double[] MEfee = new double[2];

            string valucod = "", grpcode = "";
            int len, lenn, n, brnlen;
            len = lenn = brnlen = 0;

            grpcode = objreg.ChitGroupCode;
            len = grpcode.Length;
            n = len;

            back.opn_();
            valucod = back.snocnt(@"SELECT SUBSTRING('" + grpcode + "' FROM "+n+" FOR 1)");
            if (valucod == "1")
            {
                n = len - 1;
                valucod = back.snocnt(@"SELECT SUBSTRING('" + grpcode + "' FROM " + n + " FOR 2)"); ;
            }

            objreg.brcode = back.snocnt(@"SELECT BRID FROM TABBRANCH");
            brnlen = objreg.brcode.Length;

            lenn = brnlen + 1;
            string chprd = back.snocnt(@"SELECT SUBSTRING('" + grpcode + "' FROM " + lenn + " FOR 1)");

           /* if (chprd == "0")
                chprd = grpcode.Substring((brnlen - 1), 1).ToString();*/

            
            MEfee[0] = Convert.ToDouble(back.snocnt("select COALESCE(maxdiscount,0)::int from tabchitperiod where prdcode='" + chprd + "'"));
            MEfee[1] = Convert.ToDouble(back.snocnt("select COALESCE(efee,0)::int from tabchitvalue where valuecode='" + valucod + "'"));
            back.close_();

            return MEfee;
        }

        public string GetTerminationDate(ObjectRegi objreg)
        {
            string tdtt = "";
            try
            {
                string dtcm = back.mskdt_(objreg.CommencDate);
                objreg.tmprdt = dtcm;
                int len, lenn, n, brnlen;
                len = lenn = brnlen = 0;
               string grpcode = objreg.ChitGroupCode;
               back.opn_();
                objreg.brcode = back.snocnt(@"SELECT BRID FROM TABBRANCH");
                brnlen = objreg.brcode.Length;

                lenn = brnlen + 1;
                string chprd = back.snocnt(@"SELECT SUBSTRING('" + grpcode + "' FROM " + lenn + " FOR 1)");
                objreg.totnum = Convert.ToInt32(back.snocnt("select totmembers::int from tabchitperiod where prdcode='" + chprd + "'"));
                objreg.Auctdy  =Convert.ToInt32(back.snocnt("select auctday::int from tabbranch"));
                back.close_();
                tdtt = objreg.GetTermdt();
            }
            catch { }

            return tdtt;
        }

        public int GroupRegistration(ObjectRegi objreg)
        {
            int zz = 0;
            try
            {
                back.opn_();
                string chk = "";
                chk = back.snocnt("select 1 from tabgroupreg where grpcode='" + objreg.ChitGroupCode + "'");

                if (chk != "1")
                {
                    string num = "";
                    num = back.snocnt("select insertaccounts('" + objreg.ChitGroupCode + "-1', 'acc0', '5')");
                    string qrr = @"insert into tabsubscriberinfo values ('" + num + "','" + objreg.ChitGroupCode.ToUpper() + "',1,0,NULL);";
                    back.insert(qrr, " ");

                    string regdt = back.mskdt_(objreg.PsoRegdate);
                    string cmmdt = back.mskdt_(objreg.CommencDate);
                    string tredt = back.mskdt_(objreg.TerimatDate);
                    back.insert("update tabchitgroup set status='REGISTERED' where grpcode='" + objreg.ChitGroupCode.ToUpper() + "'", " ");
                    string qry = @"insert into tabgroupreg values ('" + objreg.ChitGroupCode + "','" + objreg.PsoNo + "'," + objreg.maxdct + ",'" + regdt + "','" + cmmdt + "','" + tredt + "','Y'," + objreg.EnterncFee + ");";
                    back.insert(qry, "");
                    zz = 1;
                }
                back.close_();
            }
            catch
            {
                zz = 0;
            }
            return zz;
        }
        #endregion
    }
}
