using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace eProject.AppFile
{
    public class ShoppingCart
    {
        DataTable _cartTable;

        List<CartItem> _cartList;

        public List<CartItem> CartList
        {
            get { return _cartList; }
            set { _cartList = value; }
        }

        public ShoppingCart()
        {
            CartList = new List<CartItem>();
            _cartTable = new DataTable();
            _cartTable.Columns.Add("id", System.Type.GetType("System.Int32"));
            _cartTable.Columns.Add("name", System.Type.GetType("System.String"));
            _cartTable.Columns.Add("quantity", System.Type.GetType("System.Int32"));
            _cartTable.Columns.Add("total", System.Type.GetType("System.Int32"));
            _cartTable.Columns.Add("price", System.Type.GetType("System.Decimal"));

        }

        public void AddItem(int id, int quantity)
        {
            CartItem item = new CartItem(id, quantity);
            if (item.Total>0 && item.Quantity>0)
            {
                if (IsContain(item))
                {
                    GetItem(id).Quantity += quantity;
                }
                else
                {
                    CartList.Add(item);
                }
                if (GetItem(id).Quantity >= GetItem(id).Total)
                {
                    GetItem(id).Quantity = GetItem(id).Total;
                } 
            }
        }

        public void RemoveItem(int id)
        {
            if (GetItem(id) != null)
            {
                CartList.Remove(GetItem(id));
            }
        }

        public CartItem GetItem(int id)
        {
            foreach (CartItem it in CartList)
            {
                if (it.Id == id)
                {
                    return it;
                }
            }
            return null;
        }

        public bool IsContain(CartItem item)
        {
            foreach (CartItem it in CartList)
            {
                if (it.Id == item.Id)
                {
                    return true;
                }
            }
            return false;
        }

        public DataTable GetDataTable()
        {
            refreshTable();
            return _cartTable;
        }

        public double getTotalPrice()
        {
            double total = 0;
            foreach (CartItem it in CartList)
            {
                total += it.Price * it.Quantity;
            }
            return total;
        }

        protected void refreshTable()
        {
            _cartTable.Rows.Clear();
            foreach (CartItem it in CartList)
            {
                _cartTable.Rows.Add(it.getBoj());
            }
        }

        public void Submit(int cusId, ShoppingCart cart)
        {
            DataBinding bind = new DataBinding(ConfigurationManager.ConnectionStrings["BookStorString"].ConnectionString);
            bind.Connection.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "InsertOrder";
            SqlParameter theID = new SqlParameter("@cusId", SqlDbType.Int);
            theID.Value = cusId;
            command.Parameters.Add(theID);
            DataTable table = bind.ExecuteStore(command);
            int id = Int32.Parse(table.Rows[0][0].ToString());
            foreach (CartItem ct in cart.CartList)
            {
                bind.ExecuteQuery("update Product set Quantity = Quantity - " + ct.Quantity + " where id = " + ct.Id);
                bind.ExecuteQuery("insert into Order_Product values(" + id + "," + ct.Id + "," + ct.Price + "," + ct.Quantity + ")");
                
            }
        }
    }
}