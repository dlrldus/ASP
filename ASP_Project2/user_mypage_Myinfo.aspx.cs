using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ASP_Project2_Default : System.Web.UI.Page
    {
    protected void Page_Load(object sender, EventArgs e)
        {
        if (!IsPostBack)
            {
            SetInfo();
            }
        }
    void SetInfo()  // DropDownList를 변경했을때 내부 데이터 텍스트박스에 수정하여 업로드
        {
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);

        string SelectQuery = "Select id, password, nickname, name,birth,phone,address,email,school,major,latitude,longitude,super From userinfo Where nickname=@nickname";
        MySqlCommand cmd = new MySqlCommand(SelectQuery, connection);

        cmd.Parameters.AddWithValue("@nickname", Session["Nickname"].ToString());

        connection.Open();

        MySqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
            {
            id.Text = rd["id"].ToString();
            pwd.Text = rd["password"].ToString();
            nickname.Text = rd["nickname"].ToString();
            name.Text = rd["name"].ToString();
            birth.Text = rd["birth"].ToString();
            phone.Text = rd["phone"].ToString();
            address.Text = rd["address"].ToString();
            email.Text = rd["email"].ToString();
            school.Text = rd["school"].ToString();
            major.Text = rd["major"].ToString();
            }
        rd.Close();
        connection.Close();
        }

    protected void Update_Btn_Click(object sender, EventArgs e)
        {
        try
            {
            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            connection.Open();
            string UpdateQuery = "Update userinfo SET password=@password,address=@address where nickname=@nickname";
            MySqlCommand command = new MySqlCommand(UpdateQuery, connection);
            command.Parameters.AddWithValue("@nickname", Session["Nickname"].ToString());
            command.Parameters.AddWithValue("@password", pwd.Text);
            command.Parameters.AddWithValue("@address", address.Text);
            command.ExecuteNonQuery();
            connection.Close();
            //Response.Write("<script type='text/javascript'>alert('회원정보가 성공적으로 수정되었습니다.');window.history.go(-2);</script>");

            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    }