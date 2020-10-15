using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class QnA_Write : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Nickname"] != null)
        {
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('로그인후 이용할 수 있습니다.');location.href='Index.aspx'; </script>");
        }
    }
    protected void btnWrite_Click(object sender, EventArgs e)
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
                string InsertQuery = "INSERT INTO qna (nickname, writedate, qna_code, title, contents, image) values(@Nickname,@writedate,@qna_code,@title,@contents,@image)";
                

                MySqlCommand cmd = new MySqlCommand(InsertQuery, connection);
                
                cmd.Parameters.AddWithValue("@Nickname", Session["Nickname"].ToString());                
                cmd.Parameters.AddWithValue("@title", title.Text);
                cmd.Parameters.AddWithValue("@contents", contents.Text);                
                cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@qna_code", "확인대기");
                cmd.Parameters.AddWithValue("@image", ImageUpload.FileName);
                
                

                cmd.ExecuteNonQuery();
                //cmd2.ExecuteNonQuery();

                connection.Close();
                Response.Redirect("~/ASP_Project2/QnA_Board.aspx");
            
        
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ASP_Project2/QnA_Board.aspx");
    }

}