using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using ASP;

public partial class Main : System.Web.UI.Page
{
    string strSql = "SELECT [num], [name], [title], [writedate], [readcount], [image] ,[price] FROM [sellpost] ORDER BY [num] DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        ListDisplay();
        
    }
    private void ListDisplay()
    {
        sellpostData.SelectCommand = strSql;

    }
}