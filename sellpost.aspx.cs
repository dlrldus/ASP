using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class ASP_Project2_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Bind();
        }
        search_object.BorderWidth = 0;
    }
    public void Bind()
    {
        try
        {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = "select * from sellpost order by num desc";
            conn.Open();
            da.Fill(ds, "sellpost");
            conn.Close();
            sellpost.DataSource = ds.Tables[0].DefaultView;
            DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        MySqlCommand cmd = new MySqlCommand();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmd.Connection = conn;
        cmd.CommandText = "select num,name,title,contents,email from sellpost where " + search_object.SelectedValue + " Like '%" + SearchBox.Text + "%' ";
        conn.Open();
        da.Fill(ds, "sellpost");
        conn.Close();
        sellpost.DataSource = ds.Tables[0].DefaultView;
        DataBind();
    }
}