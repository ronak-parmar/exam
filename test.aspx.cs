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
            string questinlist = "2_4_3";
            string[] arr = questinlist.Split('_');

            string ids = String.Join(",", arr);

            string connStr = ConfigurationManager.ConnectionStrings["kurama"].ConnectionString;

            MySqlConnection conn = new MySqlConnection(connStr);
            conn.Open();
            Label1.Text = ids;
            MySqlCommand cmd = new MySqlCommand("select questionmaster.questionid,questionmaster.question,answermaster.option1,answermaster.answer,answermaster.option2,answermaster.option3 from questionmaster join answermaster on questionmaster.questionid=answermaster.questionid where questionmaster.questionid in (2,4,3) order by rand()", conn);
                cmd.Parameters.AddWithValue("@ids",ids);

            MySqlDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read())
            {   
                Label1.Text += reader["questionid"];
            }
        }
    }
}