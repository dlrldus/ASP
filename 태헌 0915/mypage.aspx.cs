using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ASP_Project2_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void note_Click(object sender, EventArgs e)
        {
        Response.Redirect("~/ASP_Project2/Note.aspx");
        }
    }