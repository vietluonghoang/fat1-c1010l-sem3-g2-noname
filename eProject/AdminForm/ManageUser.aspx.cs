using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace eProject.AdminForm
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadUser();
        }

        protected void loadUser()
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            
            DataTable table = bind.GetDataTable("select Customer.Email, Customer.Available, [Address].* from [Address],Customer where [Address].CustomerID = Customer.ID");
            GridViewUser.DataSource = table;
            GridViewUser.DataBind();
        }

        protected void setStatus(string status, int id)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.ExecuteQuery("update Customer set Available = "+ status + " where id = "+ id);

        }

        protected void GridViewUser_RowCommand(object sender, GridViewCommandEventArgs e)
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
            loadUser();
        }
    }
}