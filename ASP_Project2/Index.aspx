<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Main" ValidateRequest="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
   
    <div class="container">
 
    <img src="Images/Site-up-arrow.png" id="MOVE_TOP_BTN" />    <%--스크롤바 위로 보내는 이미지--%>

    <script>
        $(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 500) {
                    $('#MOVE_TOP_BTN').fadeIn();
                } else {
                    $('#MOVE_TOP_BTN').fadeOut();
                }
            });

            $("#MOVE_TOP_BTN").click(function () {
                $('html, body').animate({
                    scrollTop: 0
                }, 400);
                return false;
            });
        });
    </script>
     <%--이미지 슬라이드--%>
   <section class="visual row">                                    
        <div><a href="sell.aspx"><img src="Images/slide1.png" alt="" /></a></div>
        <div><img src="Images/slide2.png" alt="" /></div>
   </section>

    <script type="text/javascript">
        $('.visual').slick({
            autoplay: true,
            autoplayspeed: 4000,
            speed: 500,
            pauseOnHover: true,
            infinite: true,
            fade: true,
            cssEase: 'linear'
        });
    </script>   

    <div class="row">
        <asp:DataList ID="RecentBook" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="15" HorizontalAlign="Center" GridLines="both" Width="100%" ItemStyle-Width="300px" ItemStyle-VerticalAlign="Middle">
            <HeaderStyle BackColor="#ffcc99" Font-Size="20pt" />
            <HeaderTemplate>
                <center><b>최근 들어온 책</b></center>
            </HeaderTemplate>
            <ItemTemplate>
                <a href="<%# "View.aspx?No=" + Eval("num")%>">
                    <asp:Image ID="recentImg" ImageUrl='<%# "book/" + Eval("image") %>' runat="server" Width="100%" Height="300px" ImageAlign="Middle" /></a><br />
                <asp:Label runat="server" Text=" 제목 : "></asp:Label>
                <%# Eval("title") %><br />
                <asp:Label runat="server" Text=" 작성자 : "></asp:Label><%# Eval("name") %>
                <br />
            </ItemTemplate>
        </asp:DataList>
    </div>
    <br />


    <div class="row">
    <%--메인 최신글 - 판매게시글--%>   
        <div class="col-6 px-2">
        <asp:Label runat="server" Text="최신판매글" CssClass="Main_Board_Label"></asp:Label>           
        <asp:GridView ID="sellpostMain" runat="server" AutoGenerateColumns="False" DataKeyNames="num" EnableModelValidation="True"
            AllowPaging="True" CellPadding="4" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px" ForeColor="#333333" GridLines="None" BorderStyle="Solid" BorderWidth="2px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="num" SortExpression="title" />
                <asp:BoundField DataField="name" SortExpression="title"/>
                <asp:BoundField DataField="price" SortExpression="title" />
                <asp:BoundField DataField="writedate" SortExpression="title" />
                 <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a href="<%# "View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" BorderStyle="None" />
            <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        </div> 

    <%--메인 최신글 - 요청게시글--%>
    <div class="col-6">
    <div id="main_D_Right_D">
        <div id="Main_Board_Label">
            <asp:Label runat="server" Text="최신요청글" CssClass="Main_Board_Label"></asp:Label>
        </div>
        <asp:GridView ID="requestView" runat="server" AutoGenerateColumns="False" DataKeyNames="num" EnableModelValidation="True"
            AllowPaging="True" CellPadding="4" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px" ForeColor="#333333" GridLines="None" BorderStyle="Solid" BorderWidth="2px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="num" SortExpression="title" />
                <asp:BoundField DataField="name" SortExpression="title" />
                <asp:BoundField DataField="price" SortExpression="title" />
                <asp:BoundField DataField="writedate" SortExpression="title" />
                 <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a href="<%# "request_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
    </div>
    </div>
    </div>

    <%--광고 게시물--%>
    <div class="row">
        <div class="col-4 py-4">
        <asp:AdRotator ID="AdRotator1" runat="server"
            AdvertisementFile="~/ASP_Project2/Xml/popupzone.xml" Width="90%"/>
        </div>

        <div class="col-8 py-4">
            <asp:AdRotator ID="AdRotator2" runat="server" 
            AdvertisementFile="~/ASP_Project2/Xml/AdRotator.xml" Width="100%" Height="100%"/>
        </div>
       
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>