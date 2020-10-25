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


public partial class ASP_Project2_Default : System.Web.UI.Page
    {
    //string CommandText = "select num,name,title,image,price from sellpost order by num desc";
    //protected void Page_Load(object sender, EventArgs e)
    //    {
    //    if (!Page.IsPostBack)
    //        {
    //        Bind(CommandText);
    //        }
    //    }
    //public void Bind(string CommandTxt)
    //    {
    //    try
    //        {
    //        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
    //        MySqlCommand cmd = new MySqlCommand();
    //        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
    //        DataSet ds = new DataSet();
    //        cmd.Connection = conn;
    //        cmd.CommandText = CommandTxt;
    //        conn.Open();
    //        da.Fill(ds, "sellpost");
    //        conn.Close();
    //        RecentBook.DataSource = ds.Tables[0].DefaultView;
    //        DataBind();
    //        }
    //    catch (Exception ex)
    //        {
    //        Response.Write(ex.Message.ToString());
    //        }
    //    }
    }