using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class sell : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Nickname"] != null)
        {
            /* name.Text = Session["Nickname"].ToString();
             email.Text = Session["email"].ToString();*/
            //일단 지우는 쪽으로 했는데 남기는게 좋다면 다시 수정함
            
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('로그인후 이용할 수 있습니다.');location.href='Main.aspx'; </script>");
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
        string InsertQuery = "INSERT INTO sellpost (name,email,title,contents,writedate,readcount,image,price) values(@name,@email,@title,@contents,@writedate,0,@image,@price)";
        //string InsertQuery2 = "Insert Into reply (postnumber) Values (0)";

        MySqlCommand cmd = new MySqlCommand(InsertQuery, connection);
        //MySqlCommand cmd2 = new MySqlCommand(InsertQuery2, connection);
        cmd.Parameters.AddWithValue("@name", Session["Nickname"].ToString());
        cmd.Parameters.AddWithValue("@email", Session["email"].ToString());
        cmd.Parameters.AddWithValue("@title", title.Text);
        cmd.Parameters.AddWithValue("@contents", contents.Text);
        cmd.Parameters.AddWithValue("@price", price.Text);
        cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("@image", ImageUpload.FileName);

        cmd.ExecuteNonQuery();
        //cmd2.ExecuteNonQuery();

        connection.Close();
        Response.Redirect("~/ASP_Project2/Main.aspx");

    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ASP_Project2/Main.aspx");

        
    }
    
}