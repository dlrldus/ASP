using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;

public partial class ASP_Project2_Default : System.Web.UI.Page
    {
    //페이지 인덱스 변수
    //int intStart;
    
    protected void Page_Load(object sender, EventArgs e)
        {
        //if (!Page.IsPostBack)
        //{
        //    ViewState["Start"] = 0; // 페이지 인덱스 0
        //}

        if (Session["Nickname"] != null)
            {
            recommend_label.Text = Session["Nickname"].ToString();
            idcheck.Value = Session["Nickname"].ToString();
            
            }
        else
            {
            Response.Write("<script type='text/javascript'>alert('로그인후 이용할 수 있습니다.');location.href=history.back(); </script>");
            }

        String savePath = @"book\";

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        connection.Open();
        string UpdateQuery = "Update sellpost SET readcount=readcount + 1 where num=" + Request["No"];
        MySqlCommand command = new MySqlCommand(UpdateQuery, connection);
        command.ExecuteNonQuery();
        string SelectQuery = "Select * from sellpost where num = " + Request["No"];
        command = new MySqlCommand(SelectQuery, connection);
        MySqlDataReader reader = command.ExecuteReader();

        if (reader.Read())
            {
            sel_email.Value = reader["email"].ToString();
            nickname.Text = reader["name"].ToString();
            writeday.Text = reader["writedate"].ToString();
            readcount.Text = reader["readcount"].ToString();
            title.Text = reader["title"].ToString();
            Contents.Text = reader["contents"].ToString();
            imageout.ImageUrl = savePath + reader["image"].ToString();
            pay_code_che.Value = reader["pay_code"].ToString();
            category_f.Text = reader["Category_f"].ToString();
            category_s.Text = reader["Category_s"].ToString();
            bookname.Text = reader["book"].ToString();
            hopeprice.Text = reader["price"].ToString() + " 원";
        }
        reader.Close();
        connection.Close();
        string CommandText = "select * from reply where postloc='sellpost' and postnumber = " + Request["No"];   //댓글값이 게시글 번호와 포스트 넘버가 일치하게 맞춘뒤 가져오는구문

        Bind(CommandText);
        /* ============미완성============ */
        if (pay_code_che.Value == "거래중") // 만약 거래중인 게시글일경우, 관리자 혹은 거래진행 회원만 게시글 열람가능 구문 
            {
            if (idcheck.Value == nickname.Text || Session["Nickname"].ToString() == "관리자")
                {
                string CommandTextID = "select * from sellpost where num = " + Request["No"];
                Bind(CommandTextID);
                }
            else
                {
                Response.Write("<script type='text/javascript'>alert('거래진행중 게시글입니다.');location.href=history.back(); </script>");
                }
            }
        }
    // 목록으로 이동
    protected void back_board_Btn(object sender, EventArgs e)
        {
        Response.Redirect("sellpost_Board.aspx");                                                  // 목록버튼 클릭시
        }
    // 데이터 바인딩구문
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
            da.Fill(ds, "reply");
            ///* 페이징 구문 */
            //intStart = (int)ViewState["Start"];
            //ViewState["pageSize"] = 10;
            //da.Fill(ds, intStart, (int)ViewState["pageSize"], "reply");
            ///* 페이징 구문 */
            reply_grid.DataSource = ds.Tables[0].DefaultView;
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    protected void reply_grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string CommandText = "select * from reply where postloc='sellpost' and postnumber = " + Request["No"];   //댓글값
        reply_grid.PageIndex = e.NewPageIndex;
        Bind(CommandText);
    }
    // 댓글 삽입구문
    protected void View_Recom_Btn(object sender, EventArgs e)
        {
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        string getNumber = Request["No"];
        post_num.Value = getNumber;

        string InsertQuery = "Insert Into reply (nickname,comment,writedate,postnumber,postloc) Values (@nickname,@comment,@writedate,@postnumber,@postloc)";
        MySqlCommand command = new MySqlCommand(InsertQuery, connection);
        command.Parameters.AddWithValue("@nickname", recommend_label.Text);
        command.Parameters.AddWithValue("@comment", reply.Text);
        command.Parameters.AddWithValue("@writedate", DateTime.Now.ToString());
        command.Parameters.AddWithValue("@postnumber", post_num.Value);
        command.Parameters.AddWithValue("@postloc", "sellpost");
        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();
        Response.Write("<script type='text/javascript'>alert('댓글등록 성공'); </script>");  // 댓글등록 성공을 알림
        Response.Redirect(Request.Url.PathAndQuery);                                       // 페이지 새로고침
        }

    // 게시글 삭제시, 해당 게시글에 적혀있는 댓글의 postnum을 추적해서 지우는 구문
    /* postloc 컬럼을 통한 게시판구분 기능도 넣어야함 */
    protected void Delete_Btn_Click(object sender, EventArgs e)
        {
        // 만약 관리자라면, 본인의 게시글이 아니어도 삭제가능.
        if (Session["super"].ToString() == "관리자")
            {
            Response.Write("<script type='text/javascript'>location.href='sellpost_Board.aspx';</script>");

            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);

            string Sel_Sel = "select * from sellpost Where num = " + Request["No"];
            string Sel_Rep = "select * from reply Where postnumber = " + Request["No"];
            MySqlCommand command = new MySqlCommand(Sel_Sel, connection);
            MySqlCommand command2 = new MySqlCommand(Sel_Rep, connection);
            connection.Open();
            string Del_Sel = "Delete From sellpost where num = " + Request["No"];
            string Del_Rep = "Delete From reply where postnumber = " + Request["No"];
            MySqlCommand sell_Wri = new MySqlCommand(Del_Sel, connection);
            MySqlCommand reply_Wri = new MySqlCommand(Del_Rep, connection);
            sell_Wri.ExecuteNonQuery();
            reply_Wri.ExecuteNonQuery();
            connection.Close();
            }
        else
            {
            // 관리자계정이 아니라면, 본인의 ID와 세션이 일치해야 삭제가가능
            if (idcheck.Value == nickname.Text)
                {

                MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
                string Sel_Sel = "select * from sellpost Where num = " + Request["No"];
                string Sel_Rep = "select * from reply Where postnumber = " + Request["No"];
                MySqlCommand command = new MySqlCommand(Sel_Sel, connection);
                MySqlCommand command2 = new MySqlCommand(Sel_Rep, connection);
                connection.Open();
                string Del_Sel = "Delete From sellpost where num = " + Request["No"];
                string Del_Rep = "Delete From reply where postnumber = " + Request["No"];
                MySqlCommand sell_Wri = new MySqlCommand(Del_Sel, connection);
                MySqlCommand reply_Wri = new MySqlCommand(Del_Rep, connection);
                sell_Wri.ExecuteNonQuery();
                reply_Wri.ExecuteNonQuery();
                connection.Close();
                Response.Write("<script type='text/javascript'>alert('게시물이 삭제되었습니다.');location.href='sellpost_Board.aspx';</script>");

                }
            else
                { // 관리자도 아니며, 본인의 게시글이 아니면 게시글 삭제불가능
                Response.Write("<script type='text/javascript'>alert('타인이 작성한 게시글을 삭제할 수 없습니다.');window.history.go(-1);</script>");
                }
            }
        }
    // 구매하기 버튼 클릭시 데이터 삽입구문
    /*
     * 거래대기 상태의 게시글의 구매하기 버튼을 누르면
     * 거래대기가 거래중으로 변경되며,
     * 게시글 업로드한 회원에게 쪽지와 해당 회원의 등록된 이메일로
     * 구매신청여부에 대한 메일이 전송되는 구문
     */
    protected void Buy_obj_Click(object sender, EventArgs e)
        {
        post_val.Value = Request["No"];
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        connection.Open();
        string UpdateQuery = "Update sellpost SET pay_code = '거래중' where num=" + Request["No"];
        MySqlCommand command = new MySqlCommand(UpdateQuery, connection);
        command.ExecuteNonQuery();
        string InsertQuery = "Insert Into note(fromUser,toUser,contents,writedate,postnumber) Values (@fromUser, @toUser,@contents,@writedate,@postnumber)";
        command = new MySqlCommand(InsertQuery, connection);
        command.Parameters.AddWithValue("@fromUser", Session["Nickname"].ToString());
        command.Parameters.AddWithValue("@toUser", nickname.Text);
        command.Parameters.AddWithValue("@contents", title.Text + "게시글의 구매신청이 들어왔습니다.");
        command.Parameters.AddWithValue("@writedate", DateTime.Now.ToString());
        command.Parameters.AddWithValue("@postnumber", post_val.Value);
        //command.Parameters.AddWithValue("@writedate", DateTime.Now.ToString("yy.MM.dd :: HH:mm:ss"));
        command.ExecuteNonQuery();
        connection.Close();
        Buy_obj.Style.Add("display", "none");
        Buy_objF.Style.Add("display", "block");
        Response.Write("<script type='text/javascript'>alert('구매신청 성공했습니다.');location.href='sellpost_Board.aspx';</script>");
        // 제목과 구매신청자의 닉네임 세션을 전송
        Mail(title.Text, Session["Nickname"].ToString()); 
        }

    protected void Buy_objF_Click(object sender, EventArgs e)
    {

    }
    // 수정 버튼 입력시 페이지이동
    protected void Update_Btn_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/sellpost_Modify.aspx?No=" + Request["No"]);
        }
    /*
     * 메일 전송을 위한구문
     * smtp 기능을 사용하여 메일전송
     *  - - - - 사이트별 포트번호 - - - -
     * 네이버 포트 587
     * 다음 포트   465
     * 구글 포트   25
     * 카페24 포트 587
     */
    void Mail(string title, string who)
        {
        MailMessage message = new MailMessage();

        message.From = new MailAddress("dlrldus0917@naver.com");
        message.To.Add(new MailAddress(sel_email.Value));
        message.IsBodyHtml = true;

        message.Subject = "중헌책 구매요청안내 메일입니다.";
        message.Body = who + " 회원님께서 " + "회원님의 " + "' " + title + " '" + " 게시글에 구매신청이 들어왔습니다.<br> 사이트를 방문하여 확인해주세요!";

        message.SubjectEncoding = System.Text.Encoding.UTF8;
        message.BodyEncoding = System.Text.Encoding.UTF8;

        //SmtpClient client = new SmtpClient("smtp.gmail.com", 25);
        SmtpClient client = new SmtpClient("smtp.naver.com", 587);

        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("dlrldus0917@naver.com", "rlaxogjs09");
        client.Send(message);
        }

    ///* 이전페이지 구문 */
    //protected void lnkPrevious_Click(object sender, System.EventArgs e)
    //{
    //    intStart = (int)ViewState["Start"] - (int)ViewState["pageSize"];
    //    ViewState["Start"] = intStart;
    //    if (intStart <= 0)
    //    {
    //        ViewState["Start"] = 0;
    //    }
    //    Bind(CommandText);
    //}
    ///* 다음페이지 구문 */
    //protected void lnkNext_Click(object sender, System.EventArgs e)
    //{
    //    int dlistcount = reply_grid.Items.Count;
    //    intStart = (int)ViewState["Start"] + (int)ViewState["pageSize"];
    //    ViewState["Start"] = intStart;
    //    if (dlistcount < (int)ViewState["pageSize"])
    //    {
    //        ViewState["Start"] = (int)ViewState["Start"] - (int)ViewState["pageSize"];
    //    }
    //    Bind(CommandText);
    //}

}