using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace eProject.AdminForm
{
    public partial class ManageProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadProduct();
        }

        protected void LoadProduct()
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            DataTable table = bind.GetDataTable("select * from Product");
            GridViewProduct.DataSource = table;
            GridViewProduct.DataBind();
        }

        protected void GridViewProduct_Sorting(object sender, GridViewSortEventArgs e)
        {
            
        }


        protected void setStatus(string status, int id)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.ExecuteQuery("update Product set Available = " + status + " where id = " + id);

        }

        protected void GridViewProduct_RowCommand(object sender, GridViewCommandEventArgs e)
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
            LoadProduct();
        }
    }
}