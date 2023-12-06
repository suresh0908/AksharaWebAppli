using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectLyr
{
    public class ObjectGroup : BaseObjectGroupReg
    {

        /*Group Formation TEXTBOX VALUES*/
        #region
       
        public string ChitPeriod { get; set; }
        public string ChitPeriodvalcode { get; set; }
        public Double ChitPeriodval { get; set; }
        public string Chitvalucode { get; set; }
        public Double ChitValue { get; set; }
        
        public string ChitInstalment { get; set; }
        public string CompanyChit { get; set; }
        public Double FormenCommis { get; set; }
        public string ChitgrpStatus { get; set; }
        
        public string chitgrpseries { get; set; }
        public string txtautoextr { get; set; }
        #endregion


        /*variables*/
        #region
        public Double val { get; set; }
        public Double instm { get; set; }
        
        public string vlcd { get; set; }
        public string cnt { get; set; }
        public string ccnt { get; set; }
        

        public Double GetInstalment()
        {
            instm = val / totnum;
            instm = Math.Round(instm, 2);
            string instalm = instm.ToString();
            try
            {
                string[] arr = instalm.Split('.');
                int xx = 0;
                xx = Convert.ToInt32(arr[1]);
                if (xx >= 50)
                {
                    instm = Math.Ceiling(instm);
                }
                else
                {
                    instm = Math.Floor(instm);
                }
            }
            catch
            {
                instm = Convert.ToDouble(instalm);
            }

            return instm;
        }
        #endregion
    }
}