using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_signup_success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }

    protected void Btn_Sell_Click(object sender, EventArgs e)
    {
        Response.Redirect("sell.aspx");
    }

    protected void Btn_Goods_Click(object sender, EventArgs e)
    {
        Response.Redirect("iob_GOODS.aspx");
    }
}