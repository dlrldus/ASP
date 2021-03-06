﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ASP_Project2_Default : System.Web.UI.Page
    {
    protected void Page_Load(object sender, EventArgs e)
        {

        if (!Page.IsPostBack)
            {
            Bind(); MyBind();

            }
        }
    // 내가 올린 판매게시글 출력
    public void Bind()
        {
        try
            {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = "select * from sellpost where name = @name order by num desc limit 5";
            cmd.Parameters.AddWithValue("@name", Session["Nickname"].ToString());
            conn.Open();
            da.Fill(ds, "sellpost");
            conn.Close();
            myPost.DataSource = ds.Tables[0].DefaultView;
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    // 내가 올린 게시글중 거래중인 게시글만 출력
    public void MyBind()
        {
        try
            {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = "select * from sellpost where name = @name AND pay_code = @pay_code order by num desc limit 5";
            cmd.Parameters.AddWithValue("@name", Session["Nickname"].ToString());
            cmd.Parameters.AddWithValue("@pay_code", "Dealing");
            conn.Open();
            da.Fill(ds, "sellpost");
            conn.Close();
            deal.DataSource = ds.Tables[0].DefaultView;
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }

    protected void note_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/user_mypage_Note.aspx");
        }

    protected void Service_center_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/serviceCenter.aspx");
        }
    protected void Moduserinfo_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/user_mypage_Myinfo.aspx");
        }
    // 회원탈퇴 기능
    protected void Secession_Btn(object sender, EventArgs e)
        {
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);      
        connection.Open();
        string DeleteQuery = "Delete from userinfo where nickname = @nickname";
        MySqlCommand command = new MySqlCommand(DeleteQuery, connection);
        command.Parameters.AddWithValue("@nickname", Session["nickname"].ToString());
        command.ExecuteNonQuery();
        connection.Close();

        Response.Write("<script language='javascript'> alert('회원탈퇴 성공');</script>");
        Session.Clear();
        Response.Redirect("Index.aspx");
        }

    protected void Qna_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/QnA_Write.aspx");
        }
    }