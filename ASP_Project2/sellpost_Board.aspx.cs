using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Text;
using System.Drawing;

public partial class ASP_Project2_Default : System.Web.UI.Page
    {
    //페이지 인덱스 변수
    int intStart;
    protected void Page_Load(object sender, EventArgs e)
        {
        if (!Page.IsPostBack)
            {
            ViewState["Start"] = 0; // 페이지 인덱스 0
            Bind();
            }
        search_object.BorderWidth = 0;
        // 엔터키 입력
        SearchBox.Attributes["onkeyPress"] = "if (event.keyCode==13){" + Page.GetPostBackEventReference(ImageButton1) + "; return false;}";
        }
    //protected void sellpost_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //    {
    //    sellpost.PageIndex = e.NewPageIndex;
    //    Bind();
    //    }
    public void Bind() // 데이터 바인딩
        {
        try
            {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            PagedDataSource adsource = new PagedDataSource(); ;
            cmd.Connection = conn;
            cmd.CommandText = "select * from sellpost order by num desc";
            conn.Open();
            /* 페이징 구문 */
            intStart = (int)ViewState["Start"];
            ViewState["pageSize"] = 10;
            da.Fill(ds, intStart, (int)ViewState["pageSize"], "sellpost");
            /* 페이징 구문 */
            conn.Close();
            sellpost.DataSource = ds.Tables[0].DefaultView;
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    /* 이전페이지 구문 */
    protected void lnkPrevious_Click(object sender, System.EventArgs e)
        {
        intStart = (int)ViewState["Start"] - (int)ViewState["pageSize"]; 
        ViewState["Start"] = intStart;
        if (intStart <= 0)
            {
            ViewState["Start"] = 0;
            }
        Bind();
        }
    /* 다음페이지 구문 */
    protected void lnkNext_Click(object sender, System.EventArgs e)
        {
        int dlistcount = sellpost.Items.Count;
        intStart = (int)ViewState["Start"] + (int)ViewState["pageSize"];
        ViewState["Start"] = intStart;
        if (dlistcount < (int)ViewState["pageSize"])
            {
            ViewState["Start"] = (int)ViewState["Start"] - (int)ViewState["pageSize"];
            }
        Bind();
        }
    // 검색기능
    protected void Search_Click(object sender, EventArgs e)
        {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        MySqlCommand cmd = new MySqlCommand();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmd.Connection = conn;
        cmd.CommandText = "select num,name,title,contents,email,image,price,status,pay_code,writedate,readcount from sellpost where " + search_object.SelectedValue + " Like '%" + SearchBox.Text + "%' ";
        conn.Open();
        da.Fill(ds, "sellpost");
        conn.Close();
        sellpost.DataSource = ds.Tables[0].DefaultView;
        DataBind();
        }
    protected void sellpost_RowDataBound(object sender, GridViewRowEventArgs e)      // 결과값이 3일 초과하게되는 순간 작동하지않음
        {
        if (e.Row.RowType == DataControlRowType.DataRow)
            {
            e.Row.Cells[7].Visible = false;
            HiddenField pay_chek = (HiddenField)e.Row.FindControl("pay_code_che");
            ImageButton deal_img = (ImageButton)e.Row.FindControl("dealing_img");
            pay_chek.Value = e.Row.Cells[7].Text;

            if (pay_chek.Value == "Dealing")
                {
                deal_img.Visible = true;
                //e.Row.BackColor = Color.Cyan;
                }

            // 만약 일 차수로 하고싶으면 DS 건들고 시차수로 할거면 DM 넣을것

            //Label lbl = (Label)e.Row.FindControl("lblIndex");
            //lbl.Text = (intMax--).ToString();

            ImageButton imgvis = (ImageButton)e.Row.FindControl("NewIcon");      // CheckPoint - NewIcon
            Label telbl = (Label)e.Row.FindControl("testlbl");                   // CheckPoint - testlbl(N.checkLbl)

            string date = DateTime.Now.ToString();                               // DateTime함수에서 시간을 제외한 날짜만 입력을 받음
            string NDate = date;                                                 // Ndate 함수에 현재날짜 삽입
            string StartDate = e.Row.Cells[5].Text;                              // 그리드뷰로부터 작성 날짜 

            DateTime StDt = DateTime.Parse(StartDate);                           // DateTime으로부터 형변환 ( 작성날짜 )
            DateTime Etdt = DateTime.Parse(NDate);                               // DateTime으로부터 형변환 ( 현재날짜 )

            Label testlb = (Label)e.Row.FindControl("testlbl");                  // 테스트용 라벨
            //testlb.Text = StDt.ToShortTimeString();                            // 테스트용 라벨
            TimeSpan Swipe = Etdt - StDt;                                        // 시간간격 함수 사용 ( 작성날짜 - 현재날짜 )
            //testlb.Text = Swipe.ToString();                                    // 테스트용 라벨
            int diffDay = Swipe.Days;                                            // TimeSpan 형식을 정수형 변수에 대입 + Day Substract
            int diffMin = Swipe.Minutes;                                         // TimeSpan 형식을 정수형 변수에 대입 + Min Substract

            //telbl.Text = (diffDay.ToString());                                 // 70번째줄 지정변수 호출 - 일 차수 변수를 문자열로 형변환
            if (diffDay < 3)                                                     // Day Substract 3
                {
                if (diffMin < 300)                                               // Min Substract 300                                             
                    {
                    //e.Row.BackColor = Color.Cyan;                              // Test C.Change ( Cyan으로 변경하라 )
                    imgvis.Visible = true;                                       // 이미지 Visible 값 True 
                    }
                }
            }
        }
    }
