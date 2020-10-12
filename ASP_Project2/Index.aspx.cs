using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using ASP;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

public partial class Main : System.Web.UI.Page
{
    string CommandText = "select num,name,title,image from sellpost order by num desc limit 5";
    string CommandText2 = "select num,name,title,writedate,readcount,price from sellpost order by num desc limit 5";
    string CommandText3 = "select num,name,title,writedate,readcount,price from requestpost order by num desc limit 5";

    protected void Page_Load(object sender, EventArgs e)
    {
        //팝업창 구문 - asp_project2_popup_aspx 호출
        //Response.Write("<script language=javascript>window.open('popup.aspx', '작업진행도', 'width =930, height=430, toolbar=no, menubar=no, scrollbars=no,directories=no,status=no,titlebar=no');</script>");

        if (!Page.IsPostBack)
        {
            Bind(CommandText);
            BindNewSBoard(CommandText2);
            BindNewRBoard(CommandText3);
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
            da.Fill(ds, "sellpost");
            conn.Close();
            RecentBook.DataSource = ds.Tables[0].DefaultView;
            DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    public void BindNewSBoard(string CommandTxt)
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
            da.Fill(ds, "sellpost");
            conn.Close();
            sellpostMain.DataSource = ds.Tables[0].DefaultView;
            DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    public void BindNewRBoard(string CommandTxt)
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
            da.Fill(ds, "requestpost");
            conn.Close();
            requestView.DataSource = ds.Tables[0].DefaultView;
            DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

}