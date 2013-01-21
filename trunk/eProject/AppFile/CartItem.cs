using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace eProject.AppFile
{
    public class CartItem
    {
        public CartItem(int id, int quantity)
        {
            this._id = id;
            this._quantity = quantity;
            DataBinding bind = new DataBinding(ConfigurationManager.ConnectionStrings["BookStorString"].ConnectionString);
            bind.Connection.Open();
            SqlDataReader reader = bind.GetDataReader("select * from Product where ID = " + id);
            reader.Read();
            this._name = reader.GetString(3);
            this._total = reader.GetInt32(9);
            this._price = reader.GetDouble(6);
        }

        public Object[] getBoj()
        {
            Object[] obj = { Id, Name, Quantity, Total, Price };
            return obj;
        }

        int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        int _quantity;

        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }

        int _total;

        public int Total
        {
            get { return _total; }
            set { _total = value; }
        }

        string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        double _price;

        public double Price
        {
            get { return _price; }
            set { _price = value; }
        }
    }
}