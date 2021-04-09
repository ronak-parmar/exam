using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;
using System.Configuration;

namespace kyubi
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Studentlogin"] == null)
            {
                Response.Redirect("login.aspx");
            }
            TextBox1.Text = Session["id"].ToString();
        }

    }
}