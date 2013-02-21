using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace eProject.UserControl.Admin
{
    public partial class StatisticByCat : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadChart();
        }

        protected void loadChart()
        {
            Chart1.Series["SeriesTotalPrice"].Points.Clear();
            Chart2.Series["SeriesTotal"].Points.Clear();
            AppFile.DataBinding bind = new AppFile.DataBinding();
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "Statistic";
            DataTable table = bind.ExecuteStore(command);
            int i = 0;

            foreach (DataRow row in table.Rows)
            {
                string name = row["Name"].ToString();
                int total = Convert.ToInt32(row["Total"].ToString());
                double price = Convert.ToDouble(row["TotalPrice"].ToString());

                Chart2.Series["SeriesTotal"].Points.AddY(price);
                Chart2.Series["SeriesTotal"].Points[i].AxisLabel = name + "( " + price.ToString() + " )";
                Chart1.Series["SeriesTotalPrice"].Points.AddY(price);
                Chart1.Series["SeriesTotalPrice"].Points[i].AxisLabel = name + "( " + total.ToString() + " )";

                i++;
            }
            Chart1.DataBind();
        }

        protected void loadChart(string sDate,string eDate)
        {
            Chart1.Series["SeriesTotalPrice"].Points.Clear();
            Chart2.Series["SeriesTotal"].Points.Clear();
            AppFile.DataBinding bind = new AppFile.DataBinding();
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "StatisticByDate";
            SqlParameter sD = new SqlParameter("@sDate", SqlDbType.DateTime);
            SqlParameter eD = new SqlParameter("@eDate", SqlDbType.DateTime);
            sD.Value = sDate;
            eD.Value = eDate;
            command.Parameters.Add(sD);
            command.Parameters.Add(eD);
            DataTable table = bind.ExecuteStore(command);
            int i = 0;

            foreach (DataRow row in table.Rows)
            {
                string name = row["Code"].ToString();
                int total = Convert.ToInt32(row["Total"].ToString());
                double price = Convert.ToDouble(row["TotalPrice"].ToString());

                Chart2.Series["SeriesTotal"].Points.AddY(price);
                Chart2.Series["SeriesTotal"].Points[i].AxisLabel = name + "( " + price.ToString() + " )";
                Chart1.Series["SeriesTotalPrice"].Points.AddY(price);
                Chart1.Series["SeriesTotalPrice"].Points[i].AxisLabel = name + "( " + total.ToString() + " )";

                i++;
            }
            Chart1.DataBind();
        }

        protected void LinkButtonShowChart_Click(object sender, EventArgs e)
        {
            string sd = RadDatePicker1.SelectedDate.Value.ToString();
            string ed = RadDatePicker2.SelectedDate.Value.ToString();
            loadChart(sd, ed);
        }
    }
}