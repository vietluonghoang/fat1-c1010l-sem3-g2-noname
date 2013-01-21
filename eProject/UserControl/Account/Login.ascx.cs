using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject.UserControl.Account
{
    public partial class Login : System.Web.UI.UserControl
    {
        String _tableName;
        String _userNameColumn;
        String _passwordColumn;
        String _statusColumn;

        public String StatusColumn
        {
            get { return _statusColumn; }
            set { _statusColumn = value; }
        }

        public String PasswordColumn
        {
            get { return _passwordColumn; }
            set { _passwordColumn = value; }
        }

        public String UserNameColumn
        {
            get { return _userNameColumn; }
            set { _userNameColumn = value; }
        }

        public String TableColumn
        {
            get { return _tableName; }
            set { _tableName = value; }
        }

        //custom function
        protected void LoginWith(String userName, String password, Boolean remember)
        {

        }

        //dotnet function
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(ViewLoginButton);
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(ViewLoginForm);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

        }

    }
}