using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Drawing.Imaging;

public partial class sell : System.Web.UI.Page
    {
    string CommandTxt = "select distinct category_f from category";
    string CommandTxt2 = "select category_s from category";
    protected void Page_Load(object sender, EventArgs e)
        {

        if (Session["Nickname"] != null)
            {
            nickname.Text = Session["Nickname"].ToString();
            email.Text = Session["email"].ToString();
            }
        else
            {
            Response.Write("<script type='text/javascript'>alert('로그인후 이용할 수 있습니다.');location.href='Index.aspx'; </script>");
            }
        if (!Page.IsPostBack)
            {

            // 1차 카테고리와 2차 카테고리 바인딩
            Bind_CF();
            Bind_CS(CommandTxt2);
            }
        }
    // 데이터베이스에 저장된 1차 카테고리 목록을 DropdownList에 바인딩
    void Bind_CF()
        {
        try
            {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = CommandTxt;
            da.Fill(ds);
            category_f.DataSource = ds;
            category_f.DataTextField = "category_f";
            category_f.DataValueField = "category_f";
            category_f.DataBind();
            DataBind();
            category_f.SelectedValue = "대분류";
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    // 데이터베이스에 저장된 2차 카테고리 목록을 DropdownList에 바인딩
    public void Bind_CS(string CommandTxt2)
        {
        try
            {

            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = CommandTxt2;
            da.Fill(ds);
            category_s.DataSource = ds;
            category_s.DataTextField = "category_s";
            category_s.DataValueField = "category_s";
            category_s.DataBind();
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    // 책의 품질상태의 인덱스별 데이터 삽입
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
            string fileName = ImageUpload.FileName;  // imgUp 에있는 파일명 따오기
            savePath = savePath + fileName;          // 지역변수 설정
            ImageUpload.SaveAs(savePath);            // 설정한 지역변수값 등록
            }
        //파일 업로드 구문 끝
        if (ImageUpload.FileName != "") // 이미지가 존재하지 않는다면, 업로드 불가
            {
            if (Book_status.SelectedIndex == 0) // 책의 품질상태를 정하지않을경우 업로드 불가
                {
                Response.Write("<script type='text/javascript'>alert('책의 품질상태를 선택해주세요.'); </script>");
                }
            else
                {
                if (che_map.Checked == true)
                    {
                    MySqlConnection lolitudeConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
                    lolitudeConn.Open();
                    string SelectQuery = "select latitude,longitude from userinfo where nickname = @nickname";
                    MySqlCommand command = new MySqlCommand(SelectQuery, lolitudeConn);
                    command.Parameters.AddWithValue("@nickname", Session["Nickname"].ToString());
                    MySqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                        {
                        lati.Value = reader["latitude"].ToString();
                        longi.Value = reader["longitude"].ToString();
                        }
                    reader.Close();
                    lolitudeConn.Close();
                    }
                else
                    {
                    }

                MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
                connection.Open();
                cate_f.Value = category_f.SelectedValue; // 1차 카테고리의 SelectValue값을 cate_f 히든필드에 삽입
                cate_s.Value = category_s.SelectedValue; // 2차 카테고리의 SelectValue값을 cate_s 히든필드에 삽입
                string InsertQuery = "INSERT INTO sellpost (name,email,title,contents,writedate,readcount,image,price,pay_code,status,Category_f,Category_s,latitude,longitude) values(@name,@email,@title,@contents,@writedate,0,@image,@price,@pay_code,@status,@Category_f,@Category_s,@latitude,@longitude)";
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
                cmd.Parameters.AddWithValue("@Category_f", cate_f.Value);
                cmd.Parameters.AddWithValue("@Category_s", cate_s.Value);
                if(lati.Value != null && longi.Value != null)
                    {
                    cmd.Parameters.AddWithValue("@latitude", lati.Value);
                    cmd.Parameters.AddWithValue("@longitude", longi.Value);
                    }
                else
                    {
                    cmd.Parameters.AddWithValue("@latitude", 0);
                    cmd.Parameters.AddWithValue("@longitude", 0);
                    }
                    cmd.ExecuteNonQuery();
                //cmd2.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("~/ASP_Project2/Index.aspx");
                }
            }
        else
            {
            // 이미지 사진 필수
            Response.Write("<script type='text/javascript'>alert('도서사진은 필수업로드 항목입니다.'); </script>");
            }
        }
    protected void Cancel_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/Index.aspx");
        }
    // 1차 카테고리 선택시 2차 카테고리 명단 출력을 위한 구문 
    protected void category_f_SelectedIndexChanged(object sender, EventArgs e)
        {
        if (category_f.SelectedIndex == 0)
            {
            CommandTxt2 = "SELECT category_s from category where category_f = '공학'";
            Bind_CS(CommandTxt2);
            }
        else if (category_f.SelectedIndex == 1)
            {
            CommandTxt2 = "SELECT category_s from category where category_f = '인문'";
            Bind_CS(CommandTxt2);
            }
        else if (category_f.SelectedIndex == 2)
            {
            CommandTxt2 = "SELECT category_s from category where category_f = '교육'";
            Bind_CS(CommandTxt2);
            }
        else if (category_f.SelectedIndex == 3)
            {
            CommandTxt2 = "SELECT category_s from category where category_f = '사회'";
            Bind_CS(CommandTxt2);
            }
        else if (category_f.SelectedIndex == 4)
            {
            CommandTxt2 = "SELECT category_s from category where category_f = '예체능'";
            Bind_CS(CommandTxt2);
            }
        else if (category_f.SelectedIndex == 5)
            {
            CommandTxt2 = "SELECT category_s from category where category_f = '의학'";
            Bind_CS(CommandTxt2);
            }
        else
            {
            CommandTxt2 = "SELECT category_s from category where category_f = '자연'";
            Bind_CS(CommandTxt2);
            }
        }

    protected void category_s_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }