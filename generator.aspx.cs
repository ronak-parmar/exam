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
    public partial class generator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["teacherlogin"] == null)
            {
                Response.Redirect("login.aspx");
            }

            DropDownList1.Items.Add(new ListItem("Select Subject", ""));
            DropDownList2.Items.Add(new ListItem("Select Std", ""));
            DropDownList3.Items.Add(new ListItem("Select Chapter", ""));

            string connStr = ConfigurationManager.ConnectionStrings["kurama"].ConnectionString;

            MySqlConnection conn = new MySqlConnection(connStr);
            conn.Open();
            MySqlCommand subject = new MySqlCommand("select DISTINCT(subject) from source", conn);


            MySqlDataReader readersubject = subject.ExecuteReader();

            while (readersubject.Read())
            {
                DropDownList1.Items.Add(new ListItem((string)readersubject["subject"], (string)readersubject["subject"]));
                  
            }
            readersubject.Close();

            MySqlCommand std = new MySqlCommand("select DISTINCT(std) from source", conn);
            MySqlDataReader readerstd = std.ExecuteReader();

            while (readerstd.Read())
            {
                DropDownList2.Items.Add(new ListItem((string)readerstd["std"], (string)readerstd["std"]));
            }

            readerstd.Close();
            MySqlCommand cmd = new MySqlCommand("select * from source", conn);

            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                DropDownList3.Items.Add(new ListItem((string)reader["chapter"], reader["sourceid"].ToString()));
            }
            reader.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            int t1 = int.Parse(TextBox1.Text);
            int testmark = t1;
            string t2 = TextBox2.Text;
            string sourceid = DropDownList3.SelectedItem.Value;

            if (t1.ToString().Equals("") || t2.Equals("") || sourceid.Equals(""))
            {

            }
            else
            {

            string connStr = ConfigurationManager.ConnectionStrings["kurama"].ConnectionString;

            MySqlConnection conn = new MySqlConnection(connStr);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select questionmaster.questionid,questionmaster.question ,answermaster.answer," +
                "answermaster.option1,answermaster.option2,answermaster.option3,questionmaster.marks from questionmaster JOIN answermaster" +
                " on questionmaster.questionid=answermaster.questionid where questionmaster.sourceid=@sourceid ORDER BY RAND()", conn);

             cmd.Parameters.AddWithValue("@sourceid", sourceid);

                MySqlDataReader reader = cmd.ExecuteReader();
                string questionidlist = "";

                while (reader.Read())
                {
                    if(t1<0 || t1==0)
                    {
                        break;
                    }
                    string marks = (string)reader["marks"];
                    questionidlist += reader["questionid"]+"_";
                     t1= t1 - int.Parse(marks);
                }
                reader.Close();

                MySqlCommand testmaster = new MySqlCommand("insert into testmaster(loginid,questionidlist,marks,name)" +
                    "value(@loginid,@questionlist,@marks,@name)", conn);

                testmaster.Parameters.AddWithValue("@loginid", Session["id"]);
                testmaster.Parameters.AddWithValue("@questionlist", questionidlist);
                testmaster.Parameters.AddWithValue("@marks", testmark);
                testmaster.Parameters.AddWithValue("@name",t2);


                MySqlDataReader read = testmaster.ExecuteReader();

                Label1.Text = "Text Created"+ questionidlist;



            }









        }
    }
}