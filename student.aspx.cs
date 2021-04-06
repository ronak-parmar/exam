using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Data;
using System.Text;
namespace kyubi
{
    public partial class student : System.Web.UI.Page
    {
            DataSet ds = new DataSet();
            StringBuilder htmlTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {

           
                if (!Page.IsPostBack)
                    BindData();
          
        }
            private void BindData()
            {

                string connStr = ConfigurationManager.ConnectionStrings["kurama"].ConnectionString;

                MySqlConnection conn = new MySqlConnection(connStr);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select testmaster.name,testmaster.marks,login.name as loginname from testmaster join login on testmaster.loginid=login.id where testmaster.std=@std", conn);
                cmd.Parameters.AddWithValue("@std", Session["std"]);

                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    htmlTable.Append("<tr>");

                htmlTable.Append("<td>" + reader["name"] + "</td>");
                    htmlTable.Append("<td>" + reader["loginname"] + "</td>");
                    htmlTable.Append("<td>" + reader["marks"] + "</td>");
                htmlTable.Append("<tr>");

            }

            DBDataPlaceHolder.Controls.Add(new Literal { Text = htmlTable.ToString() });
            
            }
    }
}