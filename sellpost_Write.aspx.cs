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
            Response.Write("<script type='text/javascript'>alert('로그인후 이용할 수 있습니다.');location.href='Index.aspx'; </script>");
            }
        }
    protected void btnWrite_Click(object sender, EventArgs e)
        {
        if (Book_status.SelectedIndex == 1)
            {
            HBook_status.Value = Book_status.SelectedItem.Text;
            }
        if (Book_status.SelectedIndex == 2)
            {
            HBook_status.Value = Book_status.SelectedItem.Text;
            }
        if (Book_status.SelectedIndex == 3)
            {
            HBook_status.Value = Book_status.SelectedItem.Text;
            }
        if (Book_status.SelectedIndex == 4)
            {
            HBook_status.Value = Book_status.SelectedItem.Text;
            }

        //파일 업로드 구문 시작
        String savePath = @"C:\inetpub\wwwroot\ASP_Project2\Images\";

        if (ImageUpload.HasFile)
            {
            string fileName = ImageUpload.FileName;  // imgUp 에있는 파일평 따오기
            savePath = savePath + fileName;          // 지역변수 설정
            ImageUpload.SaveAs(savePath);            // 설정한 지역변수값 등록
            }
        //파일 업로드 구문 끝
        if (ImageUpload.FileName != "")
            {
            if (Book_status.SelectedIndex == 0) {
                Response.Write("<script type='text/javascript'>alert('책의 품질상태를 선택해주세요.'); </script>");
                }
            else
                {
                MySqlConnection connection = new MySqlConnection("Server=ec2-13-125-252-165.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");
                connection.Open();
                string InsertQuery = "INSERT INTO sellpost (name,email,title,contents,writedate,readcount,image,price,pay_code,status) values(@name,@email,@title,@contents,@writedate,0,@image,@price,@pay_code,@status)";
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
                cmd.Parameters.AddWithValue("@pay_code", "거래대기");
                cmd.Parameters.AddWithValue("@status", HBook_status.Value);

                cmd.ExecuteNonQuery();
                //cmd2.ExecuteNonQuery();

                connection.Close();
                Response.Redirect("~/ASP_Project2/Index.aspx");
                }
            }
        else
            {
            Response.Write("<script type='text/javascript'>alert('도서사진은 필수업로드 항목입니다.'); </script>");
            }
        }

    protected void Cancel_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/Index.aspx");
        }

    }