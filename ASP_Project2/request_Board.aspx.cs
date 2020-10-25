using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class ASP_Project2_Default : System.Web.UI.Page
    {
    //string strSql = "SELECT [num], [name], [title], [writedate], [readcount], [image],[gopublic],[location],[price]  FROM [requestpost] ORDER BY [num] DESC";
    string CommandText = "select * from requestpost order by num desc";

    protected void Page_Load(object sender, EventArgs e)
        {
        // 서치박스 테두리 제거
        search_object.BorderWidth = 0;
        if (!Page.IsPostBack)
            {
            Bind(CommandText);
            }
        // 엔터키 누를시 포스트백
        SearchBox.Attributes["onkeyPress"] = "if (event.keyCode==13){" + Page.GetPostBackEventReference(ImageButton1) + "; return false;}";
        }
    protected void up_request_Click(object sender, EventArgs e) // 게시글 작성 창 이동
        {
        Response.Redirect("request_Write.aspx");
        }
    // 데이터 바인딩
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
    // 그리드뷰 페이징기능
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
        requestpost_View.PageIndex = e.NewPageIndex;
        Bind(CommandText);
        }

    //지역 선택 - - - - - - - - - -
    //카테고리별 선택 - 버튼
    // 지역 코드 
    // 1  - 서울
    // 2  - 경기
    // 3  - 인천
    // 4  - 강원
    // 5  - 충북
    // 6  - 충남
    // 7  - 전북
    // 8  - 전남
    // 9  - 경북
    // 10 - 경남
    // 11 - 대구
    // 12 - 부산
    // 13 - 제주

    // 이하 지역별 버튼클릭시 지역에 맞는 데이터 바인딩
    protected void All(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost ORDER BY num desc";

        Bind(CommandText);
        }

    protected void Seoul(object sender, EventArgs e)
        {

        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 1 + " order by num desc";

        Bind(CommandText);
        }

    protected void Gyeonggi(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 2 + " order by num desc";

        Bind(CommandText);
        }

    protected void Incheon(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 3 + " order by num desc";

        Bind(CommandText);
        }
    protected void Gangwon(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 4 + " order by num desc";

        Bind(CommandText);
        }
    protected void Chungbug(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 5 + " order by num desc";

        Bind(CommandText);
        }
    protected void Chungnam(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 6 + " order by num desc";

        Bind(CommandText);
        }
    protected void Jeonbug(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 7 + " order by num desc";

        Bind(CommandText);
        }
    protected void Jeonnam(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 8 + " order by num desc";

        Bind(CommandText);
        }
    protected void Gyeongbug(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 9 + " order by num desc";

        Bind(CommandText);
        }
    protected void Gyeongnam(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 10 + " order by num desc";

        Bind(CommandText);
        }
    protected void Daegu(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 11 + " order by num desc";

        Bind(CommandText);
        }
    protected void Busan(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 12 + " order by num desc";

        Bind(CommandText);
        }
    protected void Jeju(object sender, EventArgs e)
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where loccode = " + 13 + " order by num desc";

        Bind(CommandText);
        }
    protected void Search_Click(object sender, EventArgs e) // 검색기능
        {
        CommandText = "SELECT num,name,title,contents,writedate,readcount,image,location,price from requestpost where " + search_object.SelectedValue + " Like '%" + SearchBox.Text + "%' ORDER BY num desc";
        Bind(CommandText);
        }
    //protected void requestpost_View_RowDataBound(object sender, GridViewRowEventArgs e)      
    //    {
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //        {
    //        int Number = e.Row.DataItemIndex + 1;
    //        e.Row.Cells[0].Text = Number.ToString();
    //        }
    //    }
    }