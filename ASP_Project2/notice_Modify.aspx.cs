using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

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
        // 이미지 경로
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
   // 공지사항 게시글 수정
    protected void Update_Btn(object sender, EventArgs e)
    {
        //파일 업로드 구문 시작
        String savePath = @"C:\inetpub\wwwroot\ASP_Project2\Images\";

        if (ImageUpload.HasFile)
        {
            string fileName = ImageUpload.FileName;  // imgUp 에있는 파일평 따오기
            savePath = savePath + fileName;          // 지역변수 설정
            ImageUpload.SaveAs(savePath);            // 설정한 지역변수값 등록
        }
        //파일 업로드 구문 끝
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        connection.Open();
        string UpdateQuery = "Update notice set title = @title , contents = @contents , image = @image where num = " + Request["No"];

        MySqlCommand cmd = new MySqlCommand(UpdateQuery, connection);
        cmd.Parameters.AddWithValue("@title", title.Text);
        cmd.Parameters.AddWithValue("@contents", Contents.Text);
        cmd.Parameters.AddWithValue("@image", ImageUpload.FileName);

        cmd.ExecuteNonQuery();
        connection.Close();
        Response.Write("<script type='text/javascript'>window.history.go(-2);</script>");
    }
    protected void back_board_Btn(object sender, EventArgs e)
    {
        Response.Write("<script type='text/javascript'>window.history.go(-2);</script>");     // 취소 클릭시
    }
}