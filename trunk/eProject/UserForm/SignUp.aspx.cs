using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace eProject.UserForm
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonSignUp_Click(object sender, EventArgs e)
        {
            string name = TextBoxName.Text;
            string email = TextBoxEmail.Text;
            string pass = TextBoxPass.Text;


        }

        protected void SignUpCus(string name, string email, string pass, string address, string city, string country, string phone)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "InsertCus";
            SqlParameter pName = new SqlParameter("@FullName", SqlDbType.NVarChar);
            pName.Value = name;
            command.Parameters.Add(pName);
            SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.NVarChar);
            pEmail.Value = email;
            command.Parameters.Add(pEmail);
            SqlParameter pPass = new SqlParameter("@Password", SqlDbType.NVarChar);
            pPass.Value = pass;
            command.Parameters.Add(pPass);
            SqlParameter pAddress = new SqlParameter("@Address", SqlDbType.NVarChar);
            pAddress.Value = address;
            command.Parameters.Add(pAddress);
            SqlParameter pCity = new SqlParameter("@City", SqlDbType.NVarChar);
            pCity.Value = city;
            command.Parameters.Add(pCity);
            SqlParameter pCountry = new SqlParameter("@Country", SqlDbType.NVarChar);
            pCountry.Value = country;
            command.Parameters.Add(pCountry);
            SqlParameter pPhone = new SqlParameter("@Phone", SqlDbType.NVarChar);
            pPhone.Value = phone;
            command.Parameters.Add(pPhone);
            bind.ExecuteStore(command);
        }

        protected bool UniqueUser(string email)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            DataTable table = bind.GetDataTable("select * from Customer where Email = '" + email + "'");
            if (table.Rows.Count == 0)
            {
                return true;
            }
            return false;
        }

        protected void LinkButtonCompleted_Click(object sender, EventArgs e)
        {
            string name = TextBoxName.Text;
            string email = TextBoxEmail.Text;
            string pass = TextBoxPass.Text;
            string address = TextBoxAddress.Text;
            string city = TextBoxCity.Text;
            string country = TextBoxCountry.Text;
            string phone = TextBoxPhone.Text;
            if (TextBoxPass2.Text == TextBoxPass.Text)
            {
                if (!UniqueUser(email))
                {
                    LabelError.Text = "Email already exist !";
                    LabelError.Visible = true;
                }
                else
                {
                    LabelError.Visible = false;
                    SignUpCus(name, email, pass, address, city, country, phone);
                    Page.Master.Response.Redirect("../Default.aspx");
                }
            }
            else
            {
                LabelError.Text = "re type password !";
                LabelError.Visible = true;
            }

        }
    }
}