using MySql.Data.MySqlClient;
using System.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btntest_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection("Server=ec2-13-124-56-141.ap-northeast-2.compute.amazonaws.com;Database=2020Project;Uid=root;Pwd=qwer1234;");
        connection.Open();
        string insertQuery = "INSERT INTO reply (nickname,comment,writedate,postnumber) values(2020,0902,1,59)";

        MySqlCommand command = new MySqlCommand(insertQuery, connection);
        command.ExecuteNonQuery();

        connection.Close();
    }
}

