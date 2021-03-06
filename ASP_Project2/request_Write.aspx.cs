﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        nickname.Text = Session["Nickname"].ToString();
        email.Text = Session["email"].ToString();
    }
    // 게시글 별 지역코드 삽입을 위한 구문
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Sel_location.SelectedIndex == 1)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "1";
        }
        if (Sel_location.SelectedIndex == 2)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "2";
        }
        if (Sel_location.SelectedIndex == 3)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "3";
        }
        if (Sel_location.SelectedIndex == 4)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "4";
        }
        if (Sel_location.SelectedIndex == 5)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "5";
        }
        if (Sel_location.SelectedIndex == 6)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "6";
        }
        if (Sel_location.SelectedIndex == 7)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "7";
        }
        if (Sel_location.SelectedIndex == 8)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "8";
        }
        if (Sel_location.SelectedIndex == 9)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "9";
        }
        if (Sel_location.SelectedIndex == 10)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "10";
        }
        if (Sel_location.SelectedIndex == 11)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "11";
        }
        if (Sel_location.SelectedIndex == 12)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "12";
        }
        if (Sel_location.SelectedIndex == 13)
        {
            location.Value = Sel_location.SelectedItem.Text;
            loc_code.Value = "13";
        }

        if (gopub_none.Checked)
        {
            gopub.Value = "비공개";
        }
        else if (gopub_all.Checked)
        {
            gopub.Value = "전체공개";
        }
        else if (gopub_mem.Checked)
        {
            gopub.Value = "회원공개";
        }

        String savePath = @"C:\inetpub\wwwroot\ASP_Project2\request_img\";

        if (ImageUpload.HasFile)
        {
            string fileName = ImageUpload.FileName;  // imgUp 에있는 파일평 따오기
            savePath = savePath + fileName;          // 지역변수 설정
            ImageUpload.SaveAs(savePath);            // 설정한 지역변수값 등록
        }
        //파일 업로드 구문 끝

        if (Sel_location.SelectedIndex == 0)
        {
            Response.Write("<script type='text/javascript'>alert('지역선택을 해주세요.'); </script>");
        }
        else
        {
            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            connection.Open();
            string InsertQuery = "Insert Into requestpost (name,email,title,contents,writedate,readcount,image,gopublic,location,loccode,price) Values(@name,@email,@title,@contents,@writedate,0,@image,@gopublic,@location,@loccode,@price)";
            MySqlCommand cmd = new MySqlCommand(InsertQuery, connection);

            cmd.Parameters.AddWithValue("@name", nickname.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@title", title.Text);
            cmd.Parameters.AddWithValue("@contents", content.Text);
            cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToString());
            //cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToString("yy.MM.dd :: HH:mm:ss"));
            cmd.Parameters.AddWithValue("@image", ImageUpload.FileName);
            cmd.Parameters.AddWithValue("@gopublic", gopub.Value);
            cmd.Parameters.AddWithValue("@location", location.Value);
            cmd.Parameters.AddWithValue("@loccode", loc_code.Value);
            cmd.Parameters.AddWithValue("@price", hopeprice.Text);

            cmd.ExecuteNonQuery();
            connection.Close();

            Response.Redirect("~/ASP_Project2/request_Board.aspx");
        }
    }
}