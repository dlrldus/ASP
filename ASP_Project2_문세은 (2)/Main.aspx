<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:DataList ID="RecentBook" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" DataSourceID="MainpostData" CellPadding="10" CellSpacing="15" HorizontalAlign="Center" GridLines="both" Width="100%">
            <HeaderStyle BackColor="#ffcc99" Font-Size="20pt"/>
            <HeaderTemplate>
                <center><b>오늘 들어온 책</b></center>
            </HeaderTemplate>
            <ItemTemplate>
                <a href="<%# "View.aspx?No=" + Eval("num")%>">
                <asp:Image ID="recentImg" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Height="200px" Width="160px" /></a><br />
                <!--제목--> <%# Eval("title") %> <br />
                <!--작성자--> <%# Eval("name") %> <br />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div style="background-color: beige;">
                    <a href="<%# "View.aspx?No=" + Eval("num")%>">
                 <asp:Image ID="recentImg" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Height="200px" Width="160px" /></a><br />
                <!--제목--> <%# Eval("title") %> <br />
                <!--작성자--> <%# Eval("name") %> <br />
                </div>
            </AlternatingItemTemplate>
        </asp:DataList> 
        <asp:SqlDataSource ID="MainpostData" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString %>" SelectCommand="SELECT TOP (5) [num], [name], [title], [image], [price] FROM [sellpost] ORDER BY [num] DESC"></asp:SqlDataSource>
    </div>
    <div id="rolling_banner">
        <!-- <b>이미지 슬라이드</b>
    <div style="width: 500px; margin: 300px;">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>


          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="Images/cat1.jpg" />
            </div>
            <div class="item">
              <img src="Images/cat2.jpg" />
            </div>
            <div class="item">
              <img src="Images/cat3.jpg" />
            </div>
          </div>

 
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
     </div>  -->
    </div>
    <div id="recent_post">
        <b>게시글</b>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>
