using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ASP_Project2_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Super"] != null)
        {
            if (Session["Super"].ToString() != "관리자")
            {
                Response.Write("<script type='text/javascript'>alert('관리자가 아니면 해당페이지에 접근할 수 없습니다.');location.href='Main.aspx'; </script>");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('관리자페이지로 이동합니다.'); </script>");
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('비정상적인 접근이 감지되었습니다.');location.href='Main.aspx'; </script>");
        }
    }
}