using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace eProject.AdminForm
{
    public partial class ManageCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadCategory();
        }

        protected void loadCategory()
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            DataTable table = bind.GetDataTable("select * from category");
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        protected void setStatus(string status, int id)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.ExecuteQuery("update Category set Available = " + status + " where id = " + id);

        }

        protected void DropDownListParentCat_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButtonShowAll_Click(object sender, EventArgs e)
        {
            loadCategory();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(e.CommandArgument.ToString());
            switch (e.CommandName)
            {
                case "True":
                    setStatus("0", id);
                    break;
                case "False":
                    setStatus("1", id);
                    break;
            }
            loadCategory();
        }
    }
}