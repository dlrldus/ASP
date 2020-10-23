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
            string SelectQuery = "select password from userinfo where id = @id and email = @email";
            MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
            Cmd.Parameters.AddWithValue("@id", find_info_TI.Text);
            Cmd.Parameters.AddWithValue("@email", find_info_T.Text);
            MySqlDataReader reader = Cmd.ExecuteReader();
            reader.Read();
            ResultIDlbl.Text = reader["password"].ToString();
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
    void CheInfo()
        {
        if (find_info_T.Text != "")
            {
            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            string SelectQuery = "select count(*) from userinfo where id=@id and email = @email";
            MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
            Cmd.Parameters.AddWithValue("@id", find_info_TI.Text);
            Cmd.Parameters.AddWithValue("@email", find_info_T.Text);
            connection.Open();
            int cnt = int.Parse(Cmd.ExecuteScalar().ToString());
            connection.Close();

            if (cnt == 0)
                {
                Response.Write("<script language='javascript'> alert('아이디 혹은 이메일이 일치하지 않습니다');</script>");
                }
            else
                {
                find_info_TI.Visible = false;
                find_info_T.Visible = false;
                find_info_B.Visible = false;
                check_code_T.Visible = true;
                check_code_B.Visible = true;
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
    void Mail()
        {
        Random Rand = new Random((int)DateTime.Now.Ticks);
        int Iteration = 0;
        Iteration = Rand.Next(11111111, 99999999);
        checkV.Value = Iteration.ToString();

        MailMessage message = new MailMessage();
        message.From = new MailAddress("dlrldus0917@naver.com");
        message.To.Add(new MailAddress(find_info_T.Text));
        message.IsBodyHtml = true;

        message.Subject = "중헌책 패스워드찾기 인증번호입니다.";
        message.Body = "패스워드찾기 인증번호입니다. <br>" + "인증코드는 " + Iteration + " 입니다. <br>" + "인증번호를 입력해주세요.";
        message.SubjectEncoding = System.Text.Encoding.UTF8;
        message.BodyEncoding = System.Text.Encoding.UTF8;

        SmtpClient client = new SmtpClient("smtp.naver.com", 587);
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("dlrldus0917@naver.com", "rlaxogjs09");
        client.Send(message);
        }
    }