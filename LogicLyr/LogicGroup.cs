using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web.UI.WebControls;
using DataLyr;
using ObjectLyr;

namespace LogicLyr
{
    public  class LogicGroup
    {
        backend_master back = new backend_master();
        DataGroup dbgroup = new DataGroup();
        public object UnregiterDetails()
        {
          return  dbgroup.GroupUNregDetails();
        }
        
        public DataTable Groupformt_Regview()
        {
            DataTable dt;
            dt = dbgroup.GroupFormat_reged();
            return dt;
        }
        public DataTable DropdwnChitperiod()
        {
            DataTable dt;
            dt = dbgroup.Chitperiod();
            return dt;
        }
        public DataTable DropdwnChitValue()
        {
            DataTable dt;
            dt = dbgroup.ChitGrpValue();
            return dt;
        }
        public DataTable DropdwnForman()
        {
            DataTable dt;
            dt = dbgroup.FormenconValue();
            return dt;
        }
       
        public Int32 SaveChitGroup(ObjectGroup objgrp)
        {
            try
            {
                return dbgroup.GroupFormInsert(objgrp);
            }
            catch
            {
                return 0;
            }
        }

        public DataTable AutoExtr(ObjectGroup objgrp)
        {
            DataTable dt;
            dt = dbgroup.GautoExtr(objgrp.txtautoextr);
            return dt;
        }
        public string [] Lgrpcode(ObjectGroup objgrp)
        {
            string[] result = new string[4];
           result= dbgroup.GetGropcode(objgrp);

           return result;
        }

        public double [] GMEFeevalu(ObjectRegi objreg)
        {
            double[] result = new double[2];
            result = dbgroup.GetGrpMaxEfee(objreg);

            return result;
        }
        public DataTable GroupUnregistr()
        {
            DataTable dt;
            dt = dbgroup.ChitGroupUnreg();
            return dt;
        }

        public void loaddp(DropDownList dl)
        {
            try
            {
                dbgroup.Binddropdown(dl);
            }
            catch { }
        }
        public void loadchitprd(DropDownList ddp)
        {
            try
            {
                dbgroup.DrpdnldID(ddp);
            }
            catch { }
        }
        public string LgetTermdate(ObjectRegi objreg)
        {
            string ttdt = "";
            ttdt = dbgroup.GetTerminationDate(objreg);
            return ttdt;
        }
        public Int32 SaveChitGroupRegist(ObjectRegi objreg)
        {
            try
            {
                return dbgroup.GroupRegistration(objreg);
            }
            catch
            {
                return 0;
            }
        }
    }
}
