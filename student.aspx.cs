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
            if (Session["Studentlogin"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!Page.IsPostBack)
                    BindData();
          
        }
            private void BindData()
            {

                string connStr = ConfigurationManager.ConnectionStrings["kurama"].ConnectionString;

                MySqlConnection conn = new MySqlConnection(connStr);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select testmaster.testid, testmaster.questionidlist ,testmaster.name,testmaster.marks,login.name as loginname from testmaster join login on testmaster.loginid=login.id where testmaster.std=@std", conn);
                cmd.Parameters.AddWithValue("@std", Session["std"]);

                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {   

                        
                htmlTable.Append("<tr class=\" list-group-item trtag\" onclick=\"attempttest('" + reader["questionidlist"] + "','"+reader["testid"] +"')\"  style=\"margin-top:10px\">");

                htmlTable.Append("<td>Name:" + reader["name"] +           "</td>");
                htmlTable.Append("<td>TeacherName:-" + reader["loginname"] +          "</td>");
                htmlTable.Append("<td>Marks" + reader["marks"] + "</td>");
                htmlTable.Append("</tr>");

            }

                if(!reader.HasRows)
                {
                    Label1.Text = "No Test Available";
                }

            DBDataPlaceHolder.Controls.Add(new Literal { Text = htmlTable.ToString() });
            
            }
    }
}