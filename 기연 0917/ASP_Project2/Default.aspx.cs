using MySql.Data.MySqlClient;
using System.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //protected void Btntest_Click(object sender, EventArgs e)
    //{
    //    MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
    //    connection.Open();
    //    //string insertQuery = "INSERT INTO reply (nickname,comment,writedate,postnumber) values(999,999,999,999)";
    //    string selectQuery = "Select num,nickname,comment,writedate,postnumber From reply";
    //    //MySqlCommand command = new MySqlCommand(insertQuery, connection);
    //    MySqlCommand command = new MySqlCommand(selectQuery, connection);
    //    command.ExecuteNonQuery();

    //    MySqlDataReader reader = command.ExecuteReader();

    //    Repeater1.DataSource = reader;
    //    Repeater1.DataBind();
    //    reader.Close();

    //    connection.Close();
    //}
}

