using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace eProject.AppFile
{
    public class DataBinding
    {
        SqlConnection _connection;

        public SqlConnection Connection
        {
            get { return _connection; }
            set { _connection = value; }
        }
        SqlCommand _command;

        public SqlCommand Command
        {
            get { return _command; }
            set { _command = value; }
        }

        string _connectionString;

        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }

        public DataBinding(string ConnectionString)
        {
            this.ConnectionString = ConnectionString;
            if (TestConnection(ConnectionString))
            {
                Connection = new SqlConnection(ConnectionString);
                Command = new SqlCommand();
                Command.Connection = Connection;

            }
        }

        public bool TestConnection(String ConnectionString)
        {
            bool flag = false;
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            if (conn.State == System.Data.ConnectionState.Open)
            {
                flag = true;
            }
            conn.Close();
            return flag;
        }

        public SqlDataReader GetDataReader(string query)
        {
            Command.CommandText = query;
            SqlDataReader reader = Command.ExecuteReader();
            return reader;
        }

        public DataTable GetDataTable(string query)
        {
            Command.CommandText = query;
            SqlDataAdapter adapter = new SqlDataAdapter(Command);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            return dataSet.Tables[0];
        }

        public void ExecuteQuery(string query)
        {
            Command.CommandText = query;
            Command.ExecuteNonQuery();
        }

        public DataTable ExecuteStore(SqlCommand command)
        {
            command.Connection = Connection;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            return dataSet.Tables[0];
        }
    }
}