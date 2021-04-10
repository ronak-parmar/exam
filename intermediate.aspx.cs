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
    public partial class intermediate1 : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        StringBuilder htmlTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["teacherlogin"] == null)
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
            MySqlCommand cmd = new MySqlCommand("select result.marks,login.name as username,testmaster.name,testmaster.marks as totalmarks from result join login on login.id=result.userid join testmaster on testmaster.testid=result.testid where  testmaster.testid in(select testid from testmaster where loginid=@loginid)", conn);
            cmd.Parameters.AddWithValue("@loginid", Session["id"]);

            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {


                htmlTable.Append("<tr class=\" list-group-item trtag\" style=\"margin-top:10px\">");

                htmlTable.Append("<td>Student Name:" + reader["username"] +"</td>");
                htmlTable.Append("<td>   TestName:-" + reader["name"] + "</td>");
                htmlTable.Append("<td>Mark:-" + reader["marks"] + "</td>");
                htmlTable.Append("<td>outof:-" + reader["totalmarks"] + "</td>");
                htmlTable.Append("</tr>");

            }


            DBDataPlaceHolder.Controls.Add(new Literal { Text = htmlTable.ToString() });

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