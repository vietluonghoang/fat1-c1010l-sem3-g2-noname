using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace eProject.AdminForm
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["proID"] == null)
                {
                    LoadCat();
                    LinkButton1.Visible = false;
                }
                else
                {
                    string id = Request.QueryString["proID"];
                    LoadProduct(Int32.Parse(id));
                }
            }
        }

        protected void LoadProduct(int id)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            DataTable table = bind.GetDataTable("select * from Product where ID = " + id);
            LoadCat();
            TextBoxCode.Text = table.Rows[0]["Code"].ToString();
            TextBoxName.Text = table.Rows[0]["Name"].ToString();
            TextBoxPrice.Text = table.Rows[0]["Price"].ToString();
            TextBoxAuthor.Text = table.Rows[0]["Author"].ToString();
            TextBoxManu.Text = table.Rows[0]["Manufacturer"].ToString();
            TextBoxQuan.Text = table.Rows[0]["Quantity"].ToString();
            TextBoxDes.Text = table.Rows[0]["Description"].ToString();
            string cat = table.Rows[0]["SubCategoryID"].ToString();
            string status = table.Rows[0]["Available"].ToString();
            string thumb = table.Rows[0]["Thumbnail"].ToString();
            ImageThumb.ImageUrl = thumb;
            for (int i = 0; i < DropDownListCat.Items.Count; i++)
            {
                if (DropDownListCat.Items[i].Value == cat)
                {
                    DropDownListCat.SelectedIndex = i;
                    DropDownListCat.DataBind();
                }
            }
            CheckBoxAvailable.Checked = Boolean.Parse(status);
        }

        private void LoadCat()
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            DataTable table = bind.GetDataTable("select * from Category where Available = 'True' and ParentCategoryID is not NULL");
            DropDownListCat.DataSource = table;
            DropDownListCat.DataTextField = "Name";
            DropDownListCat.DataValueField = "ID";
            DropDownListCat.DataBind();
        }

        protected void updateProd(int id, string code, string subCat, string name, string price, string author, string manufac, string quant, string status, string des)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            bind.ExecuteQuery("update Product set Code = '" + code + "', SubCategoryID = " + subCat + ", Name = '" + name + "', Price = " + price + " , Author = '" + author + "', Manufacturer = '" + manufac + "', Quantity = '" + quant + "', Available = '" + status + "' , Description ='" + des + "' where ID = " + id);
        }

        protected void insertProd(string code, string subCat, string name, string thumb, string price, string author, string manufac, string quant, string status, string des)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            bind.ExecuteQuery("insert into Product values('" + code + "'," + subCat + ",'" + name + "',null,'" + thumb + "'," + price + ",'" + author + "','" + manufac + "','" + quant + "','" + status + "','" + DateTime.Now.ToString() + "','" + des + "')");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string saveDir = @"Resource/Upload/thumbnail/";
            string appPath = Request.PhysicalApplicationPath;
            if (FileUploadThumb.HasFile)
            {
                string savePath = appPath + saveDir + Server.HtmlEncode(FileUploadThumb.FileName);
                string pos = saveDir + Server.HtmlEncode(FileUploadThumb.FileName);
                string data = @"../../Resource/Upload/thumbnail/" + FileUploadThumb.FileName;
                FileUploadThumb.SaveAs(savePath);
                AppFile.DataBinding bind = new AppFile.DataBinding();
                bind.Connection.Open();
                bind.ExecuteQuery("update Product set thumbnail = '" + data + "' where ID = " + Request.QueryString["proID"]);
                LabelThumbnail.Text = "Saved !";
                LabelThumbnail.Visible = true;
                ImageThumb.ImageUrl = data;
            }
        }

        private bool isExist(string code)
        {
            AppFile.DataBinding bind = new AppFile.DataBinding();
            bind.Connection.Open();
            SqlDataReader reader = bind.GetDataReader("select * from Product where code = '" + code + "'");
            if (reader.Read())
            {
                if (Request.QueryString["proID"] != null)
                {
                    if (reader.GetInt32(0).ToString() != Request.QueryString["proID"])
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
            string id = Request.QueryString["proID"];
            string code = TextBoxCode.Text;
            string subCat = DropDownListCat.SelectedItem.Value;
            string name = TextBoxName.Text;
            string price = TextBoxPrice.Text;
            string author = TextBoxAuthor.Text;
            string manu = TextBoxManu.Text;
            string quant = TextBoxQuan.Text;
            string status = CheckBoxAvailable.Checked.ToString();
            string des = TextBoxDes.Text;
            if (!isExist(code))
            {
                if (Request.QueryString["proID"] != null)
                {
                    updateProd(Int32.Parse(id), code, subCat, name, price, author, manu, quant, status, des);
                }
                else
                {
                    string saveDir = @"Resource/Upload/thumbnail/";
                    string appPath = Request.PhysicalApplicationPath;
                    string data = "";
                    if (FileUploadThumb.HasFile)
                    {
                        string savePath = appPath + saveDir + Server.HtmlEncode(FileUploadThumb.FileName);
                        string pos = saveDir + Server.HtmlEncode(FileUploadThumb.FileName);
                        data = @"../../Resource/Upload/thumbnail/" + FileUploadThumb.FileName;
                        FileUploadThumb.SaveAs(savePath);
                        
                    }
                    insertProd(code, subCat, name, data, price, author, manu, quant, status, des);
                }
                LabelMessage.Text = "Saved !";
                LabelMessage.Visible = true;
            }
            else
            {
                LabelMessage.Text = "Duplicated Code !";
                LabelMessage.Visible = true;
            }

        }


    }
}