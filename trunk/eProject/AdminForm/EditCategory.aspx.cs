using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace eProject.AdminForm
{
    public partial class EditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["catID"] == null)
                {
                    LoadDropDown();
                }
                else
                {
                    LoadComponent();
                }

            }
        }



        protected void LoadComponent()
        {
            LoadDropDown();
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            SqlDataReader reader = bind.GetDataReader("select * from Category where id = " + Request.QueryString["catID"]);
            reader.Read();
            TextBoxCode.Text = reader.GetString(1);
            TextBoxName.Text = reader.GetString(2);
            TextBoxDes.Text = reader.GetString(3);
            bool status = reader.GetBoolean(5);
            if (status)
            {
                DropDownListStatus.SelectedIndex = 0;
            }
            else
            {
                DropDownListStatus.SelectedIndex = 1;
            }
            if (!reader.IsDBNull(4))
            {
                int parent = reader.GetInt32(4);
                reader.Close();
                SqlDataReader reader1 = bind.GetDataReader("select * from Category where id = " + parent);
                reader1.Read();
                for (int i = 0; i < DropDownListParent.Items.Count; i++)
                {
                    if (DropDownListParent.Items[i].Text == reader1.GetString(1))
                    {
                        DropDownListParent.SelectedIndex = i;
                        DropDownListParent.DataBind();
                    }
                }
                CheckBox1.Checked = false;
                DropDownListParent.Enabled = true;
            }
            else
            {
                CheckBox1.Checked = true;
                DropDownListParent.Enabled = false;
            }
        }

        protected void LoadDropDown()
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            DataTable table = bind.GetDataTable("select * from Category where ParentCategoryID is null");
            DropDownListParent.DataSource = table;
            DropDownListParent.DataBind();
        }

        protected void UpdateCat(string id, string code, string name, string des, string parentID, string status)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            string qry = "update Category set Code = '" + code + "' , Name = '" + name + "' , Description = '" + des + "' , ParentCategoryID = " + parentID + " , Available = '" + status + "' where id = " + id;
            bind.ExecuteQuery(qry);
        }

        protected void InsertCat(string code, string name, string des, string parentID, string status)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            string qry = "insert into Category values('" + code + "','" + name + "','" + des + "'," + parentID + ",'" + status +"')";
            bind.ExecuteQuery(qry);
        }

        protected bool IsExist(string code)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            string qry = "select * from Category where Code = '" + code + "'";
            SqlDataReader reader = bind.GetDataReader(qry);
            if (reader.Read())
            {
                if (Request.QueryString["catID"] != null)
                {
                    if (reader.GetInt32(0).ToString() != Request.QueryString["catID"])
                    {
                        return true;
                    }
                }
                else
                {
                    return true;
                }
            }
            return false;
        }

        protected void LinkButtonSave_Click(object sender, EventArgs e)
        {

            string id = Request.QueryString["catID"];
            string code = TextBoxCode.Text;
            string name = TextBoxName.Text;
            string des = TextBoxDes.Text;
            string parentID = DropDownListParent.SelectedItem.Value;
            string status = DropDownListStatus.SelectedItem.Text;
            if (CheckBox1.Checked)
            {
                parentID = "NULL";
            }

            if (!IsExist(code))
            {
                if (Request.QueryString["catID"] != null)
                {
                    UpdateCat(id, code, name, des, parentID, status);
                    LabelMessage.Text = "The category is updated !";
                    LoadComponent();
                }
                else
                {
                    InsertCat(code, name, des, parentID, status);
                    LabelMessage.Text = "Saved !";
                }
            }
            else
            {
                LabelMessage.Text = "Duplicated Code !";
            }
            

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                DropDownListParent.Enabled = false;
            }
            else
            {
                DropDownListParent.Enabled = true;
            }
        }
    }
}