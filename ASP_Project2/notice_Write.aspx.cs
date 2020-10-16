using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        nickname.Text = Session["Nickname"].ToString();
        email.Text = Session["email"].ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        String savePath = @"C:\inetpub\wwwroot\ASP_Project2\request_img\";

        if (ImageUpload.HasFile)
        {
            string fileName = ImageUpload.FileName;  // imgUp 에있는 파일평 따오기
            savePath = savePath + fileName;          // 지역변수 설정
            ImageUpload.SaveAs(savePath);            // 설정한 지역변수값 등록
        }
        //파일 업로드 구문 끝

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        connection.Open();
            string InsertQuery = "Insert Into notice(name,title,contents,image,readcount,writedate) Values(@name,@title,@contents,@image,0,writedate)";
            MySqlCommand cmd = new MySqlCommand(InsertQuery, connection);

            cmd.Parameters.AddWithValue("@name", nickname.Text);
            cmd.Parameters.AddWithValue("@title", title.Text);
            cmd.Parameters.AddWithValue("@contents", content.Text);
            cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToString());
            //cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToString("yy.MM.dd :: HH:mm:ss"));
            cmd.Parameters.AddWithValue("@image", ImageUpload.FileName);

            cmd.ExecuteNonQuery();
            connection.Close();

            Response.Redirect("~/ASP_Project2/notice_Board.aspx");
        
    }
}