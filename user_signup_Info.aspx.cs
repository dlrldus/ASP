using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;
using System.Configuration;

public partial class signup2 : System.Web.UI.Page
    {
    protected void Page_Load(object sender, EventArgs e)
        {
        string Password = pwd.Text;
        pwd.Attributes.Add("value", Password);
        string PasswordChe = pwdcheck.Text;
        pwdcheck.Attributes.Add("value", PasswordChe);

        //포스트백 - 출력구문
        if (!Page.IsPostBack)
            {
            DisplayYear();
            DisplayMonth();
            DisplayDay(31);
            }
        if (IsPostBack)
            return;
        }

    protected void Btn_Click(object sender, EventArgs e)
        {
        Response.Redirect("Index.aspx");
        }

    private void DisplayDay(int maxDay)
        {
        //1일부터 31일까지 출력 (일수)
        this.lstDay.Items.Clear();
        for (int i = 1; i <= maxDay; i++)
            {
            this.lstDay.Items.Add(new ListItem(i.ToString()));
            }
        }

    private void DisplayMonth()
        {
        //1월부터 12월까지 출력 (달수)
        for (int i = 1; i <= 12; i++)
            {
            this.lstMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

    private void DisplayYear()
        {
        //현재년도수 - 100  ~ 현재년도까지 출력 (년수)
        for (int i = DateTime.Now.Year; i > DateTime.Now.Year - 100; i--)
            {
            this.lstYear.Items.Add(new ListItem(i.ToString()));
            }
        }

    protected void lstYear_SelectedIndexChanged(object sender, EventArgs e)
        {
        GetDaysInMonth();
        }

    private void GetDaysInMonth()
        {
        int day = DateTime.DaysInMonth(Convert.ToInt32(lstYear.SelectedValue), Convert.ToInt32(lstMonth.SelectedValue));
        DisplayDay(day);
        }

    protected void lstMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
        GetDaysInMonth();
        }
    protected void EmailList_OnSelectedIndexChanged(object sender, EventArgs e)
        {
        if (EmailList.SelectedIndex == 0)
            domainText.Text = "";
        if (EmailList.SelectedIndex == 1)
            domainText.Text = "naver.com";
        if (EmailList.SelectedIndex == 2)
            domainText.Text = "daum.net";
        if (EmailList.SelectedIndex == 3)
            domainText.Text = "google.co.kr";
        }

    protected void phoneList_OnSelectedIndexChanged(object sender, EventArgs e)
        {
        //if (EmailList.SelectedIndex == 0)

        //if (EmailList.SelectedIndex == 1)

        //if (EmailList.SelectedIndex == 2)
        }

    protected void ImageButton1_Click(object sender, EventArgs e)
        {
        Response.Redirect(string.Format("Index.aspx"));
        }

    protected void Signup_Btn_click(object sender, EventArgs e)
        {
        if (IDche_Va.Value == "0" && Niche_Va.Value == "1")
            {
            Response.Write("<script language='javascript'> alert('아이디 중복체크를 해주세요.');</script>");
            }
        else if (IDche_Va.Value == "1" && Niche_Va.Value == "0")
            {
            Response.Write("<script language='javascript'> alert('닉네임 중복체크를 해주세요.');</script>");
            }
        else if (IDche_Va.Value == "1" && Niche_Va.Value == "1")
            {
            if (check_code_T.Text == checkV.Value.ToString())
                {
                birthyear.Value = lstYear.SelectedValue; birthmonth.Value = lstMonth.SelectedValue; birthday.Value = lstDay.SelectedValue;
                phonesum.Text = phone1.Text + "-" + phone2.Text + "-" + phone3.Text;
                birth.Value = birthyear.Value + "/" + birthmonth.Value + "/" + birthday.Value;
                sum_email.Value = email.Text + "@" + domainText.Text;
                MySqlConnection connection = new MySqlConnection("Server=ec2-13-125-252-165.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");



                string InsertQuery = "Insert Into userinfo (id, password, nickname, name,birth,phone,address,email,school,major,latitude,longitude,super) " +
                    "Values (@id, @pw, @nick, @name,@birth,@phonesum,@address,@email,0,0,0,0,'일반계정')";

                MySqlCommand cmd = new MySqlCommand(InsertQuery, connection);
                cmd.Parameters.AddWithValue("@id", id.Text);
                cmd.Parameters.AddWithValue("@pw", pwd.Text);
                cmd.Parameters.AddWithValue("@nick", nickname.Text);
                cmd.Parameters.AddWithValue("@name", name.Text);
                cmd.Parameters.AddWithValue("@birth", birth.Value);
                cmd.Parameters.AddWithValue("@phonesum", phonesum.Text);
                cmd.Parameters.AddWithValue("@address", sample5_address.Text);
                cmd.Parameters.AddWithValue("@email", sum_email.Value);

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
                Mail();
                Response.Write("<script language='javascript'> alert('회원가입성공! 로그인해주세요.');location.href='Index.aspx';</script>");
                }
            else
                {
                Response.Write("<script language='javascript'> alert('이메일 인증을 진행해주세요.');</script>");
                }
            }
        else
            {
            Response.Write("<script language='javascript'> alert('아이디 혹은 닉네임 항목중 중복체크확인 하지않은 항목이 있습니다.');</script>");
            }
        }
    protected void IDCheck_Click(object sender, EventArgs e)
        {
        MySqlConnection connection = new MySqlConnection("Server=ec2-13-125-252-165.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");
        string SelectQuery = "select count(*) from userinfo where id = @id";
        MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
        Cmd.Parameters.AddWithValue("@id", id.Text);
        connection.Open();
        int cnt = int.Parse(Cmd.ExecuteScalar().ToString());
        connection.Close();

        if (cnt == 0)
            {
            Response.Write("<script language='javascript'> alert('사용가능한 아이디입니다.');</script>");
            IDche_Va.Value = "1";
            }
        else
            {
            Response.Write("<script language='javascript'> alert('이미 존재하는 아이디입니다.');</script>");
            id.Text = "";
            }
        IDCheck.Attributes.Add("onclick", "return false");
        }

    protected void NickCheck_Click(object sender, EventArgs e)
        {
        MySqlConnection connection = new MySqlConnection("Server=ec2-13-125-252-165.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");
        string SelectQuery = "select count(*) from userinfo where nickname = @nickname";
        MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
        Cmd.Parameters.AddWithValue("@nickname", nickname.Text);
        connection.Open();
        int cnt = int.Parse(Cmd.ExecuteScalar().ToString());
        connection.Close();

        if (cnt == 0)
            {
            Response.Write("<script language='javascript'> alert('사용가능한 닉네임입니다.');</script>");
            Niche_Va.Value = "1";
            }
        else
            {
            Response.Write("<script language='javascript'> alert('이미 존재하는 닉네임입니다.');</script>");
            nickname.Text = "";
            }
        }
    protected void Find_info(object sender, EventArgs e)
        {
        sum_email.Value = email.Text + "@" + domainText.Text;

        if (sum_email.Value != "")
            {
            find_info_B.Visible = false;
            check_code_T.Visible = true;
            check_code_B.Visible = true;
            //retry.Visible = true;
            Response.Write("<script language='javascript'> alert('입력하신 이메일로 인증번호를 보냈습니다.');</script>");
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "", "StartTimer();", true);
            Mail();

            }
        else
            {
            Response.Write("<script language='javascript'> alert('이메일을 입력해주세요!!!');</script>");
            }
        }
    protected void Insert_CheCode(object sender, EventArgs e)
        {
        if (check_code_T.Text == checkV.Value.ToString())
            {
            Response.Write("<script language='javascript'> alert('인증이 완료되었습니다!');</script>");
            check_code_T.Visible = false;
            check_code_B.Visible = false;
            }
        else
            {
            Response.Write("<script language='javascript'> alert('인증번호가 일치하지 않습니다!');</script>");
            }
        }
    void Mail()
        {
        Random Rand = new Random((int)DateTime.Now.Ticks);
        int Iteration = 0;
        Iteration = Rand.Next(11111111, 99999999);
        checkV.Value = Iteration.ToString();
        // 난수를 데이터베이스에 넣은후, 이메일 인증창에 해당 코드를 입력했을때 맞으면 가입 틀리면 난수 재생성후 재전송 루틴 짤것

        MailMessage message = new MailMessage();

        message.From = new MailAddress("dlrldus0917@naver.com");
        message.To.Add(new MailAddress(sum_email.Value));
        message.IsBodyHtml = true;

        message.Subject = "회원 가입 환영 안내";
        message.Body = "중헌책가입을 환영합니다 <br>" + "인증코드는 " + Iteration + " 입니다. <br>" + "회원가입창에 입력후 회원가입을 완료하세요.";
        Attachment at = new Attachment(@"C:\inetpub\wwwroot\ASP_Project2\Images\slide2.png", MediaTypeNames.Image.Jpeg);
        at.ContentId = "ContentIDO";  //Attachment의 ContentID를 통해 메일 내용의 Img태그에서 접근 가능함
        message.Attachments.Add(at);

        message.SubjectEncoding = System.Text.Encoding.UTF8;
        message.BodyEncoding = System.Text.Encoding.UTF8;

        //SmtpClient client = new SmtpClient("smtp.gmail.com", 25);
        SmtpClient client = new SmtpClient("smtp.naver.com", 587);

        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("dlrldus0917@naver.com", "rlaxogjs09");
        client.Send(message);
        }
    }