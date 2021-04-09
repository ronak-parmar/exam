using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace kyubi
{
    public partial class intermediate1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Studentlogin"]!= null)
            {
                Response.Redirect("login.aspx");
            }

            if (Session["teacherlogin"] == null)
            {
                Response.Redirect("login.aspx");
            }





        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addquestion.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("generator.aspx");
        }
    }
}