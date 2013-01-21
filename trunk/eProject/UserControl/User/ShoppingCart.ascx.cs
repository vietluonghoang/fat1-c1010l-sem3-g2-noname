using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject.UserControl.User
{
    public partial class ShoppingCart : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(ViewIn);
            ShowCart();
        }

        public void ShowCart()
        {
            AppFile.ShoppingCart Cart = new AppFile.ShoppingCart();
            if (Session["MyCart"] != null)
            {
                Cart = Session["MyCart"] as AppFile.ShoppingCart;
            }
            GridViewCart.DataSource = Cart.GetDataTable();
            LabelTotalPrice.Text = "Total: " + Cart.getTotalPrice().ToString() + " $";
            if (Cart.CartList.Count == 0)
            {
                LinkButtonClearCart.Visible = false;
                LinkButtonSubmitCart.Visible = false;
            }
            else
            {
                LinkButtonClearCart.Visible = true;
                LinkButtonSubmitCart.Visible = true;
            }
            GridViewCart.DataBind();

        }


        protected void GridViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            AppFile.ShoppingCart Cart = new AppFile.ShoppingCart();
            if (Session["MyCart"] != null)
            {
                Cart = Session["MyCart"] as AppFile.ShoppingCart;
            }
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(GridViewCart.DataKeys[index].Values["id"].ToString());
                switch (e.CommandName.ToString())
                {
                    case "DeleteFromCart":
                        Cart.RemoveItem(id);
                        Session["MyCart"] = Cart;
                        ShowCart();
                        break;
                }
            }
        }

        protected void LinkButtonClearCart_Click(object sender, EventArgs e)
        {
            if (Session["MyCart"] != null)
            {
                Session["MyCart"] = new AppFile.ShoppingCart();
            }
            ShowCart();
        }

        protected void LinkButtonSubmitCart_Click(object sender, EventArgs e)
        {
            AppFile.ShoppingCart Cart = new AppFile.ShoppingCart();
            if (Session["MyCart"] != null)
            {
                Cart = Session["MyCart"] as AppFile.ShoppingCart;
                Cart.Submit(1,Cart);
            }
            if (Session["MyCart"] != null)
            {
                Session["MyCart"] = new AppFile.ShoppingCart();
            }
            ShowCart();
        }
    }
}