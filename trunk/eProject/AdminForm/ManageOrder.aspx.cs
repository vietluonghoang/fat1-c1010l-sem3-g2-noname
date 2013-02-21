using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace eProject.AdminForm
{
    public partial class ManageOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadOrder();
            }
        }

        protected void LoadOrder()
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            DataTable table = bind.GetDataTable("select [Order].ID, Customer.Email,	[Order].StatusID, [Order].CreatedOn, Address.City, sum(Order_Product.Price * Order_Product.Quantity) as TotalPrice from [Order], Order_Product, Customer, Address where Customer.ID = Address.CustomerID and [Order].ID = Order_Product.OrderID and	[Order].CustomerID = Customer.ID group by [Order].ID, Customer.Email, [Order].StatusID, [Order].CreatedOn, Address.City");
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}