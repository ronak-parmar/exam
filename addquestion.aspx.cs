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
    public partial class addquestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.Items.Add(new ListItem("Select Subject",""));
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
                DropDownList3.Items.Add(new ListItem((string)reader["chapter"],reader["sourceid"].ToString()));
            }
            reader.Close();

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string question = TextBox1.Text;
            string ans = TextBox2.Text;
            string op1 = TextBox3.Text;
            string op2 = TextBox4.Text;
            string op3 = TextBox5.Text;
            string marks = TextBox6.Text;
            string sourceid = DropDownList3.SelectedItem.Value;

            if (ans.Equals(op1) || ans.Equals(op2) || ans.Equals(op3) || op1.Equals(op2) || op2.Equals(op3) || op1.Equals(op3) || op2.Equals(op3))
            {
                Label1.Text = "Option are same!";
            }
            else
            {
                string connStr = ConfigurationManager.ConnectionStrings["kurama"].ConnectionString;

                MySqlConnection conn = new MySqlConnection(connStr);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("insert into questionmaster(sourceid,question,marks) value(@sourceid,@question,@marks)", conn);
                cmd.Parameters.AddWithValue("@sourceid", sourceid);
                cmd.Parameters.AddWithValue("@question", question);
                cmd.Parameters.AddWithValue("@marks", marks);

                MySqlDataReader reader = cmd.ExecuteReader();
                long id = cmd.LastInsertedId;
                reader.Close();

                MySqlCommand anss = new MySqlCommand("insert into answermaster(questionid,answer,option1,option2,option3) value(@id,@ans,@op1,@op2,@op3)", conn);
                anss.Parameters.AddWithValue("@id", id);
                anss.Parameters.AddWithValue("@ans", ans);
                anss.Parameters.AddWithValue("@op1", op1);
                anss.Parameters.AddWithValue("@op2", op2);
                anss.Parameters.AddWithValue("@op3", op3);
                anss.ExecuteReader();

                Response.Write("<script>alert(' Question Added ') </script>");

                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
               


            }
        }

      
    }
}