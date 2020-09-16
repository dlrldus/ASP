﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class signup2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Password = pwd.Text;
        pwd.Attributes.Add("value", Password);
        string PasswordChe = pwdcheck.Text;
        pwdcheck.Attributes.Add("value", PasswordChe);
        {
            //포스트백 - 출력구문
            if (!Page.IsPostBack)
            {
                DisplayYear();
                DisplayMonth();
                DisplayDay(31);
            }
        }
    }

    protected void Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");
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
        Response.Redirect(string.Format("main.aspx"));
    }

    protected void Signup_Btn_click(object sender, EventArgs e)
    {
        birthyear.Value = lstYear.SelectedValue; birthmonth.Value = lstMonth.SelectedValue; birthday.Value = lstDay.SelectedValue;
        phonesum.Text = phone1.Text + "-" + phone2.Text + "-" + phone3.Text;
        birth.Value = birthyear.Value + "/" + birthmonth.Value + "/" + birthday.Value;
        MySqlConnection connection = new MySqlConnection("Server=ec2-13-125-252-165.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");
        string SelectQuery = "select count(*) from userinfo where id = @id";
        MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
        Cmd.Parameters.AddWithValue("@id", id.Text);
        connection.Open();
        int cnt = int.Parse(Cmd.ExecuteScalar().ToString());
        connection.Close();

        if (cnt == 0)
        {
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
            cmd.Parameters.AddWithValue("@email", email.Text);

            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();

            Response.Write("<script language='javascript'> alert('회원가입성공! 로그인해주세요.');location.href='Main.aspx';</script>");
        }
        else
        {
            Response.Write("<script language='javascript'> alert('이미 존재하는 아이디입니다.');</script>");

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
        }
        else
        {
            Response.Write("<script language='javascript'> alert('이미 존재하는 아이디입니다.');</script>");
            id.Text = "";
        }
    }

    protected void NickCheck_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection("Server=ec2-13-125-252-165.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");
        string SelectQuery = "select count(*) from userinfo where nickname = @nickname";
        MySqlCommand Cmd = new MySqlCommand(SelectQuery, connection);
        Cmd.Parameters.AddWithValue("@id", id.Text);
        connection.Open();
        int cnt = int.Parse(Cmd.ExecuteScalar().ToString());
        connection.Close();

        if (cnt == 0)
        {

            Response.Write("<script language='javascript'> alert('사용가능한 닉네임입니다.');</script>");
        }
        else
        {
            Response.Write("<script language='javascript'> alert('이미 존재하는 닉네임입니다.');</script>");
            nickname.Text = "";
        }
    }
}