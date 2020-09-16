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
    protected void Page_Load(object sender, EventArgs e)
        {
        if (!Page.IsPostBack)
            {
            Bind();
            }
        search_object.BorderWidth = 0;
        }
    protected void sellpost_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
        sellpost.PageIndex = e.NewPageIndex;
        Bind();
        }
    public void Bind()
        {
        try
            {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cmd.Connection = conn;
            cmd.CommandText = "select * from sellpost order by num desc";
            conn.Open();
            da.Fill(ds, "sellpost");
            conn.Close();
            sellpost.DataSource = ds.Tables[0].DefaultView;
            DataBind();
            }
        catch (Exception ex)
            {
            Response.Write(ex.Message.ToString());
            }
        }
    protected void Search_Click(object sender, EventArgs e)
        {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["mariadb"].ConnectionString);
        MySqlCommand cmd = new MySqlCommand();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmd.Connection = conn;
        cmd.CommandText = "select num,name,title,contents,email from sellpost where " + search_object.SelectedValue + " Like '%" + SearchBox.Text + "%' ";
        conn.Open();
        da.Fill(ds, "sellpost");
        conn.Close();
        sellpost.DataSource = ds.Tables[0].DefaultView;
        DataBind();
        }
    protected void sellpost_RowDataBound(object sender, GridViewRowEventArgs e)     
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

            ImageButton imgvis = (ImageButton)e.Row.FindControl("NewIcon");      
            Label telbl = (Label)e.Row.FindControl("testlbl");                 

            string date = DateTime.Now.ToString();                              
            string NDate = date;                                              
            string StartDate = e.Row.Cells[5].Text;                          

            DateTime StDt = DateTime.Parse(StartDate);                          
            DateTime Etdt = DateTime.Parse(NDate);                          

            Label testlb = (Label)e.Row.FindControl("testlbl");               
            //testlb.Text = StDt.ToShortTimeString();                            
            TimeSpan Swipe = Etdt - StDt;                                     
            //testlb.Text = Swipe.ToString();                                    
            int diffDay = Swipe.Days;                                            
            int diffMin = Swipe.Minutes;                                         

            //telbl.Text = (diffDay.ToString());                                 
            if (diffDay < 3)                                                     
                {
                if (diffMin < 300)                                                                                         
                    {
                    imgvis.Visible = true;                                       
                    }
                }
            }
        }
    }
