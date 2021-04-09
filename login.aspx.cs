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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
          
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = Email.Text;
            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = regex.Match(email);
            if (!match.Success)
            {
                Mesg.Text = "Invalid Email";
            }
            else if (Password.Text.Length == 0)
            {
                Mesg.Text = "Enter Password";
            }
            else
            {

                string connStr = ConfigurationManager.ConnectionStrings["kurama"].ConnectionString;

                MySqlConnection conn = new MySqlConnection(connStr);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select * from login where email=@email", conn);
                cmd.Parameters.AddWithValue("@email", email);

                MySqlDataReader reader = cmd.ExecuteReader();

                reader.Read();

                if (reader.HasRows)
                {
                    if (Password.Text.Equals((string)reader["password"]))
                    {
               
                        Mesg.Text = "Login Successful!";

                        if (reader["flag"].ToString().Equals("True"))
                        {
                            Session["teacherlogin"] = true;
                            Session["id"] = reader["id"];

                            Response.Redirect("intermediate.aspx");
                        }
                        else
                        {
                           

                            Session["Studentlogin"] = true;
                            Session["id"] = reader["id"];
                            Session["std"]=reader["std"];
                            Response.Redirect("student.aspx");
                        }
                    }
                    else
                    {
                        Mesg.Text = "Password Doesn't match!!";
                    }

                }
                else
                {
                    Mesg.Text = "Email Not Register!";
                }



                reader.Close();
                conn.Close();
            }
        }








    }
}