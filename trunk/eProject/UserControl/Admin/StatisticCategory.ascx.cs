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
    public partial class StatisticCategory : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadChart(1);
                loadDropDown(); 
            }
        }

        protected void loadChart(int catID)
        {
            Chart1.Series["SeriesTotalPrice"].Points.Clear();
            AppFile.DataBinding bind = new AppFile.DataBinding();
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter theID = new SqlParameter("@catId", SqlDbType.Int);
            theID.Value = catID;
            command.Parameters.Add(theID);
            command.CommandText = "StatisticByCat";
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

        

        protected void loadDropDown()
        {
            DropDownListCategory.Items.Clear();
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            DataTable dt = bind.GetDataTable("select * from Category");
            DropDownListCategory.DataSource = dt;
            DropDownListCategory.DataBind();
        }

        

        protected void LinkButtonShowChart_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(DropDownListCategory.Items[DropDownListCategory.SelectedIndex].Value);
            
            loadChart(id);
            
        }

        
    }
}