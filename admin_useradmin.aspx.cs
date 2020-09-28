using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

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
        Bind(CommandText2);
        }
    protected void ChangeGrant_Click(object sender, EventArgs e)
        {
        Button ChangeBtn = (Button)sender;
        long id = Convert.ToInt32(ChangeBtn.CommandArgument);
        Bind(CommandText2);
        }
    }