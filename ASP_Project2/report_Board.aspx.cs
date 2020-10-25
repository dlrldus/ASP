using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class report_Board : System.Web.UI.Page
{
    string CommandText = "select * from requestpost order by num desc";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Nickname"] != null)
        {

            Bind(CommandText);

        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('로그인후 이용할 수 있습니다.');location.href='serviceCenter.aspx'; </script>");
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
            cmd.CommandText = CommandTxt; /*"select * from requestpost";*/
            //CommandTxt = cmd.CommandText;
            conn.Open();
            da.Fill(ds, "requestpost");
            conn.Close();
            requestpost_View.DataSource = ds.Tables[0].DefaultView;
            DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }




    protected void ReportWrite_Click(object sender, EventArgs e)
    {
        Response.Redirect("reportform.aspx");
    }
}