﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class ASP_Project2_Default : System.Web.UI.Page
    {

    string CommandText = "select super,id,nickname,name,phone,address,email from userinfo where super not in ('관리자')";
    string CommandText2 = "Update userinfo set super" + "관리자" + "where id=" + "1234";
    protected void Page_Load(object sender, EventArgs e)
        {
        if (!Page.IsPostBack)
            {
            Bind(CommandText);
            }

        if (Session["Super"] != null)
            {
            if (Session["Super"].ToString() != "관리자")
                {
                Response.Write("<script type='text/javascript'>alert('관리자가 아니면 해당페이지에 접근할 수 없습니다.');location.href='Index.aspx'; </script>");
                }
            else
                {
                Response.Write("<script type='text/javascript'>alert('관리자페이지로 이동합니다.'); </script>");
                }
            }
        else
            {
            Response.Write("<script type='text/javascript'>alert('비정상적인 접근이 감지되었습니다.');location.href='Index.aspx'; </script>");
            }
        }

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
            da.Fill(ds, "userinfo");
            conn.Close();
            userinfo.DataSource = ds.Tables[0].DefaultView;
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }


    protected void Del_user(object sender, EventArgs e)
        {
       
        }
    protected void ChangeGrant_Click(object sender, EventArgs e)
        {
    
        }

    protected void userinfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        string id = userinfo.DataKeys[e.RowIndex].Value.ToString();

        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        string DeleteQuery = "Delete from userinfo where ID = @id";
        MySqlCommand cmd = new MySqlCommand(DeleteQuery, conn);
        cmd.Parameters.AddWithValue("@id", id);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        Bind(CommandText);
        }
    protected void userinfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        string id = userinfo.DataKeys[e.RowIndex].Value.ToString();

        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        string UpdateQuery = "update userinfo set super=@super where id = @id";
        MySqlCommand cmd = new MySqlCommand(UpdateQuery, conn);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@super", "관리자");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        Bind(CommandText);
        }

    }