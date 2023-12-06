using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectLyr
{
    public class ObjectRegi : BaseObjectGroupReg 
    {
        /*Group REgistr TEXTBOX VALUES*/
        #region
        public string  UnregdChitgroup { get; set; }
        public string  PsoNo { get; set; }
        public string PsoRegdate { get; set; }
        public string CommencDate { get; set; }
        public string TerimatDate { get; set; }
        public Double  EnterncFee { get; set; }

        public int Auctdy { get; set; }
        public string tmprdt { get; set; }
        

        public string GetTermdt()
        {
            string trmdt="";
            int a, b, c;
            try
            {
                string nxt = Convert.ToDateTime(tmprdt).ToString("MM/dd/yyyy");

                DateTime terdt = Convert.ToDateTime(nxt);
                DateTime terdat1;


                string dd = Convert.ToDateTime(tmprdt).ToString("dd");

                terdat1 = terdt.AddMonths(Convert.ToInt32(totnum) - 1);
                a = Auctdy;
                b = Convert.ToInt32(dd);

                //  c = a - b;

                string termnth = terdat1.ToString("MM");
                int trrdt = Convert.ToInt32(terdat1.ToString("dd"));
                if (termnth == "02" && b > trrdt)
                {
                    c = -3;
                }
                else
                {
                    c = a - b;
                }
                terdat1 = terdat1.AddDays(c);
                trmdt = terdat1.ToString("dd/MM/yyyy");
            }
            catch { trmdt = ""; }
            return trmdt;
        }

        public bool checkcommdt()
        {
            string psonxt = Convert.ToDateTime(PsoRegdate).ToString("MM/dd/yyyy");
            string cmnnxt = Convert.ToDateTime(CommencDate).ToString("MM/dd/yyyy");

            DateTime psodt = Convert.ToDateTime(psonxt);
            DateTime cmdt = Convert.ToDateTime(cmnnxt);

            if (psodt > cmdt)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion
    }
}
