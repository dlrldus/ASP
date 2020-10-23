using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

public partial class ASP_Project2_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Nickname"] != null)
        {

        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('로그인후 이용할 수 있습니다.');location.href=history.back(); </script>");
        }
        String savePath = @"request_img\";

        if (!IsPostBack)
        {
            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            connection.Open();
            string UpdateQuery = "Update notice SET readcount=readcount + 1 where num=" + Request["No"];
            MySqlCommand command = new MySqlCommand(UpdateQuery, connection);
            command.ExecuteNonQuery();
            string SelectQuery = "Select * from notice where num = " + Request["No"];
            command = new MySqlCommand(SelectQuery, connection);
            MySqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                nickname.Text = reader["name"].ToString();
                writeday.Text = reader["writedate"].ToString();
                readcount.Text = reader["readcount"].ToString();
                title.Text = reader["title"].ToString();
                Contents.Text = reader["contents"].ToString();
                imageout.ImageUrl = savePath + reader["image"].ToString();
            }
            reader.Close();
            connection.Close();
            }
    }
    protected void back_board_Btn(object sender, EventArgs e)
    {
        Response.Write("<script type='text/javascript'>window.history.go(-2);</script>");
    }

    protected void Update_Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ASP_Project2/notice_Modify.aspx?No=" + Request["No"]);
    }
}