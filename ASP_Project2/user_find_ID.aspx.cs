using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ASP_Project2_Default : System.Web.UI.Page
    {
    protected void Find_info(object sender, EventArgs e)
        {
        CheInfo();
        }
    protected void Insert_CheCode(object sender, EventArgs e)
        {
        if (check_code_T.Text == checkV.Value.ToString())
            {
            ment.Text = "회원님의 아이디는 아래와같습니다.";
            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            connection.Open();
            string SelectQuery = "select id from userinfo where email = @email";
            MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
            Cmd.Parameters.AddWithValue("@email", find_info_T.Text);
            MySqlDataReader reader = Cmd.ExecuteReader();
            reader.Read();
            ResultIDlbl.Text = reader["id"].ToString();
            ResultIDlbl.Attributes.Add("style", "color:Blue;");        
            reader.Close();
            connection.Close();
            check_code_T.Visible = false;
            check_code_B.Visible = false;
            Resultlbl.Visible = true;
            Resultlbl2.Visible = true;
            gotomain.Visible = true;
            }
        else
            {
            Response.Write("<script language='javascript'> alert('인증번호가 일치하지않습니다.');</script>");
            }
        }

    protected void goto_main(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/Index.aspx");
        }
    //protected void Retry(object sender, EventArgs e)
    //    {
    //    CheInfo();
    //    }
    // 이메일 인증을 위한 구문
    void CheInfo()
        {
        if (find_info_T.Text != "")
            {
            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            string SelectQuery = "select count(*) from userinfo where email = @email";
            MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
            Cmd.Parameters.AddWithValue("@email", find_info_T.Text);
            connection.Open();
            // 일치하는 이메일이 있을경우 cnt값 증가
            int cnt = int.Parse(Cmd.ExecuteScalar().ToString());
            connection.Close();

            if (cnt == 0) // 일치한 이메일이 존재하지 않을경우
                {
                Response.Write("<script language='javascript'> alert('존재하지않는 이메일입니다.');</script>");
                }
            else
                {
                // 입력한 이메일이 일치할경우 해당 메일로 인증코드 전송
                find_info_T.Visible = false; // 이메일 입력 텍스트박스 숨김
                find_info_B.Visible = false; // 이메일 입력 버튼 숨김
                check_code_T.Visible = true; // 인증코드 입력 텍스트박스 출력
                check_code_B.Visible = true; // 인증코드 입력 버튼 출력
                //retry.Visible = true;
                Response.Write("<script language='javascript'> alert('입력하신 이메일로 인증번호를 보냈습니다.');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "StartTimer();", true);
                ment.Text = "인증코드를 입력해주세요.";
                Mail();
                }
            }
        else
            {
            Response.Write("<script language='javascript'> alert('이메일을 입력해주세요!!!');</script>");
            }
        }
    // 인증코드 전송을 위한 메일구문
    void Mail()
        {
        Random Rand = new Random((int)DateTime.Now.Ticks); // Rand 생성
        int Iteration = 0;                                 // 난수를 저장하기 위한 변수선언
        Iteration = Rand.Next(00000001, 99999999);         // 1부터 99999999 까지의 사이에서 난수 생성
        checkV.Value = Iteration.ToString();               // 생성한 난수를 히든필드에 저장 - 추후 데이터베이스에 임시 저장으로 변경예정

        MailMessage message = new MailMessage();

        message.From = new MailAddress("dlrldus0917@naver.com");
        message.To.Add(new MailAddress(find_info_T.Text));
        message.IsBodyHtml = true;

        message.Subject = "중헌책 아이디찾기 인증번호입니다.";
        message.Body = "아이디찾기 인증번호입니다. <br>" + "인증코드는 " + Iteration + " 입니다. <br>" + "인증번호를 입력해주세요.";
        message.SubjectEncoding = System.Text.Encoding.UTF8;
        message.BodyEncoding = System.Text.Encoding.UTF8;

        SmtpClient client = new SmtpClient("smtp.naver.com", 587);
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("dlrldus0917@naver.com", "rlaxogjs09");
        client.Send(message);
        }
    }