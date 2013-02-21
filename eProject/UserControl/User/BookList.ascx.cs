using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace eProject.UserControl.User
{
    public partial class BookList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showBooks();
        }

        public void showBooks()
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            DataTable table = bind.GetDataTable("Select * from Product where Available = 'True'");
            GridViewBooks.DataSource = table;
            GridViewBooks.DataBind();
        }

        protected void GridViewBooks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblQuant = e.Row.Cells[2].FindControl("LabelQuant") as Label;
                LinkButton lbtnAdd = e.Row.Cells[3].FindControl("LinkButtonAddToCart") as LinkButton;
                int quantity = Int32.Parse(lblQuant.Text);
                if (quantity == 0)
                {
                    e.Row.Cells[2].Controls.Clear();
                    e.Row.Cells[2].Text = "running out";
                    lbtnAdd.Visible = false;
                }
                
            }
        }

        protected void GridViewBooks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Int32.Parse(e.CommandArgument.ToString());
            int id = Int32.Parse(GridViewBooks.DataKeys[index].Values["id"].ToString());
            
            AppFile.ShoppingCart Cart = new AppFile.ShoppingCart();
            if (Session["MyCart"] != null)
            {
                Cart = Session["MyCart"] as AppFile.ShoppingCart;
            }
            Cart.AddItem(id,1);
            Session["MyCart"] = Cart;
            ShoppingCart sc = Page.Master.FindControl("ShoppingCart1") as ShoppingCart;
            sc.ShowCart();
            showBooks();
        }
    }
}