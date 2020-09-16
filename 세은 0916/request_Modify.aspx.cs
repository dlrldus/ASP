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
            recommend_label.Text = Session["Nickname"].ToString();
            idcheck.Value = Session["Nickname"].ToString();
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
            string UpdateQuery = "Update requestpost SET readcount=readcount + 1 where num=" + Request["No"];
            MySqlCommand command = new MySqlCommand(UpdateQuery, connection);
            command.ExecuteNonQuery();
            string SelectQuery = "Select * from requestpost where num = " + Request["No"];
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
    protected void View_Recom_Btn(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        string getNumber = Request["No"];
        post_num.Value = getNumber;

        string InsertQuery = "Insert Into reply (nickname,comment,writedate,postnumber) Values ( @nickname, @comment,@writedate,@postnumber)";
        MySqlCommand command = new MySqlCommand(InsertQuery, connection);
        command.Parameters.AddWithValue("@nickname", recommend_label.Text);
        command.Parameters.AddWithValue("@comment", reply.Text);
        command.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
        command.Parameters.AddWithValue("@postnumber", post_num.Value);
        connection.Open();
        command.ExecuteNonQuery();

        connection.Close();
        Response.Write("<script type='text/javascript'>alert('댓글등록 성공'); </script>");  // 댓글등록 성공을 알림
        Response.Redirect(Request.Url.PathAndQuery);                                       // 페이지 새로고침
    }

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
        MySqlConnection connection = new MySqlConnection("Server=ec2-13-125-252-165.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");
        connection.Open();
        string UpdateQuery = "Update requestpost set title = @title , contents = @contents , image = @image where num = " + Request["No"];

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