using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        siteinfo.ForeColor = System.Drawing.Color.White;
        terms.ForeColor = System.Drawing.Color.White;
        privacy.ForeColor = System.Drawing.Color.White;
        serviceCenter.ForeColor = System.Drawing.Color.White;

        Login_PWD.Attributes["onkeyPress"] = "if (event.keyCode==13){" +
                 Page.GetPostBackEventReference(Btn_Log) + "; return false;}";

        //관리자계정 구분
        if (Session["Super"] != null)
        { // Super값이 '관리자'라면 ( 관리자 계정이라면, ) 회원관리 버튼을 추가
            if (Session["Super"].ToString() == "관리자")
            {
                Btn_Admin.Visible = true;
            }
            else
            {
                Btn_Mypage.Visible = true;
            }
        }
        //세션값의 존재여부에 따른 로그인 버튼관리
        if (Session["Nickname"] != null)
        { // 세션이 존재한다면 .
            before_login.Style.Add("display", "none");    // 로그인 이전
            after_login.Style.Add("display", "block");    // 로그인 이후
            Nickname.Text = Session["Nickname"].ToString() + "님 반갑습니다."; // 세션 ( 닉네임 ) + 문자열 출력
        }
        else if (Session["Nickname"] == null)
        { // 세션이 존재하지않는다면 .
            before_login.Style.Add("display", "block");  // 로그인 이전
            after_login.Style.Add("display", "none");    // 로그인 이후
        }
    }
    protected void Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");                  // 메인페이지 이동
    }
    protected void Login_button(object sender, EventArgs e)
    {
        if (LoginInfo(Login_ID.Text, Login_PWD.Text))     // 아이디, 패스워드 텍스트박스의 문자열이 데이터베이스와 일치하면,
        {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = "Select id,email,nickname,super From userinfo Where id=@id";
            cmd.Parameters.AddWithValue("@id", Login_ID.Text);

            conn.Open();
            MySqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                getemail.Value = String.Format("{0}", rd["email"]);   // 게시글 작성시 표시할 이메일 세션값
                getnick.Value = String.Format("{0}", rd["nickname"]); // 로그인후 로그인창에 표시할 닉네임값
                getsuper.Value = String.Format("{0}", rd["super"]);   // 관리자 계정 구분용
            }
            rd.Close();
            conn.Close();
            //  ======================== 로그인시 버튼 컨트룰 & 세션 관리 ====================================
            Session["Nickname"] = getnick.Value; // 게시글 작성, 메인페이지 로그인박스내에 표기할 닉네임 세션값
            Session["email"] = getemail.Value;   // 게시글 작성시 표시할 이메일 세션값
            Session["Super"] = getsuper.Value;   // 관리자 계정 구분용 세션값  /* Int32.Parse(getsuper.Value);*/ 

            /*  테스트  */// testlabel.Text = Session["Super"].ToString(); // 관리자 계정 구분 TEST용 라벨

            if (Session["Nickname"].ToString() != null) // 세션값이 존재한다면. 
            {
                before_login.Style.Add("display", "none");  // 로그인 이전
                after_login.Style.Add("display", "block");    // 로그인 이후
                Nickname.Text = Session["Nickname"].ToString() + "님 반갑습니다."; // 세션 ( 닉네임 ) + 문자열 출력
            }
            else
            { // 세션값이 하지않는다면 .
              //  -------------  //
                before_login.Style.Add("display", "block");  // 로그인 이전
                after_login.Style.Add("display", "none");    // 로그인 이후
            }
            Server.Transfer("Index.aspx"); // 메인페이지 세션 저장 + 리로드
        }
        else
        {   // 아이디 패스워드 하나라도 일치하지 않을경우, 일치하지않음을 경고하고 재 로그인 시킴
            Response.Write("<script type='text/javascript'>alert('가입된계정이 아니거나, 아이디 또는 패스워드가 일치하지않습니다.'); </script>");
        }
    }

    // 로그인시도를 할 경우 데이터베이스 내에 ID와 PWD일치 여부를 판별하여 count 수를 증가한다. 
    bool LoginInfo(string userID, string password)
    {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        MySqlCommand cmd = new MySqlCommand();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmd.Connection = conn;
        cmd.CommandText = "select count(id) from userinfo where id = @ID and password = @Password";
        cmd.Parameters.AddWithValue("@ID", userID);
        cmd.Parameters.AddWithValue("@Password", password);
        conn.Open();
        da.Fill(ds, "userinfo");
        //int count = (int)cmd.ExecuteScalar();
        int cnt = int.Parse(cmd.ExecuteScalar().ToString());
        conn.Close();
        return cnt > 0;
    }
    // 로그아웃 버튼 클릭 구문
    protected void Btn_Logout_Click(object sender, EventArgs e) // 로그아웃 버튼 클릭시
    {
        Response.Write("<script type='text/javascript'>alert('로그아웃 되었습니다.'); </script>");
        Session.Clear();
        before_login.Style.Add("display", "block");  // 로그인 이전
        after_login.Style.Add("display", "none");    // 로그인 이후
        Nickname.Text = "";                          // 닉네임 라벨 초기화
        Response.Redirect("Index.aspx");              // 메인페이지 리로드
    }


    protected void Btn_Admin_Click(object sender, EventArgs e) // 회원관리 버튼 클릭시
    {
        ContentPlaceHolder MainContent = FindControl("MainContent") as ContentPlaceHolder;
        Server.Transfer("admin_useradmin.aspx");
    }
    protected void Btn_Mypage_Click(object sender, EventArgs e)
    {
        ContentPlaceHolder MainContent = FindControl("MainContent") as ContentPlaceHolder;
        Server.Transfer("mypage_main.aspx");
    }


    protected void note_btn(object sender, ImageClickEventArgs e)
        {
        Response.Redirect("~/ASP_Project2/mypage_Note.aspx");
        }
    }

