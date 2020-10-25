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
            string CommandText = "select * from reply where postloc='request' and postnumber = " + Request["No"];   //댓글값이 게시글 번호와 포스트 넘버가 일치하게 맞춘뒤 가져오는구문

            Bind(CommandText);
            }
    }
    // 댓글 바인딩
    public void Bind(string CommandTxt)
        {
        try
            {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = CommandTxt;
            conn.Open();
            da.Fill(ds, "reply");
            conn.Close();
            reply_grid.DataSource = ds.Tables[0].DefaultView;
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    // 댓글입력 기능
    protected void View_Recom_Btn(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        string getNumber = Request["No"];
        post_num.Value = getNumber; // 게시글 번호를 히든필드에 저장 ( 데이터베이스에 삽입을 위함)

        string InsertQuery = "Insert Into reply (nickname,comment,writedate,postnumber,postloc) Values ( @nickname, @comment,@writedate,@postnumber,@postloc)";
        MySqlCommand command = new MySqlCommand(InsertQuery, connection);
        command.Parameters.AddWithValue("@nickname", recommend_label.Text);
        command.Parameters.AddWithValue("@comment", reply.Text);
        command.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
        command.Parameters.AddWithValue("@postnumber", post_num.Value); // 게시글 번호 저장
        command.Parameters.AddWithValue("@postloc", "request");         // 테이블에 게시판별 댓글을 구분하기 위한 컬럼/
        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();
        Response.Write("<script type='text/javascript'>alert('댓글등록 성공'); </script>");  // 댓글등록 성공을 알림
        Response.Redirect(Request.Url.PathAndQuery);                                       // 페이지 새로고침
    }


    protected void back_board_Btn(object sender, EventArgs e)
    {
        Response.Write("<script type='text/javascript'>window.history.go(-2);</script>");
    }

    protected void Update_Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ASP_Project2/request_Modify.aspx?No=" + Request["No"]);
    }
}