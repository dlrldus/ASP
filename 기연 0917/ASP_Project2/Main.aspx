<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" ValidateRequest="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
   

   <section class="visual">
        <div><a href="sell.aspx"><img src="Images/slide1.png" alt="" /></a></div>
        <div><img src="Images/slide2.png" alt="" /></div>
   </section>

    <script type="text/javascript">

        $('.visual').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplayspeed: 4000,
            speed: 500,
            pauseOnHover: true,
            infinite : true
        });

    </script>

    <div id="mainpop">
        <asp:DataList ID="RecentBook" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="15" HorizontalAlign="Center" GridLines="both" Width="100%" ItemStyle-Width="300px" ItemStyle-VerticalAlign="Middle">
            <HeaderStyle BackColor="#ffcc99" Font-Size="20pt" />
            <HeaderTemplate>
                <center><b>오늘 들어온 책</b></center>
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
    <div id="main_D_Left">
        <div>
            <table border="1" style="text-align: center; margin: auto; width: 95%; height: 800px;">
                <tr>
                    <td colspan="2" style="height: 60px; font-size: 18pt;">구현중인 내용 및 완성도
                    </td>
                </tr>
                <tr>
                    <td style="width: 55%; height: 60px; font-size: 18pt;">계획
                    </td>
                    <td style="width: 45%; height: 60px; font-size: 18pt;">완성도
                    </td>
                </tr>
                <tr>
                    <td>아이디, 닉네임 중복체크</td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td>메인페이지 그리드뷰 출력</td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td>회원관리기능</td>
                    <td>관리자가 회원탈퇴시키기 가능</td>
                </tr>
                <tr>
                    <td>카카오맵API 구현</td>
                    <td>지도는뜸</td>
                </tr>
                <tr>
                    <td>판매게시판</td>
                    <td>글작성 가능 (디자인X)</td>
                </tr>
                <tr>
                    <td>구매게시판</td>
                    <td>글확인 가능 (디자인X)</td>
                </tr>
                <tr>
                    <td>요청게시판</td>
                    <td>0%</td>
                </tr>
                <tr>
                    <td>QNA게시판</td>
                    <td>0%</td>
                </tr>
                <tr>
                    <td>신고게시판</td>
                    <td>0%</td>
                </tr>
            </table>
        </div>
    </div>
    <%--메인 최신글 - 판매게시글--%>
    <div id="main_D_Right">

        

        <div id="Main_Board_Label">
            <asp:Label runat="server" Text="최신판매글" CssClass="Main_Board_Label"></asp:Label>
        </div>
        <asp:GridView ID="sellpostMain" runat="server" AutoGenerateColumns="False" DataKeyNames="num" EnableModelValidation="True"
            AllowPaging="True" CellPadding="4" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px" ForeColor="#333333" GridLines="None">
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
    <div id="main_D_Right_D">
        <div id="Main_Board_Label">
            <asp:Label runat="server" Text="최신요청글" CssClass="Main_Board_Label"></asp:Label>
        </div>
        <asp:GridView ID="requestView" runat="server" AutoGenerateColumns="False" DataKeyNames="num" EnableModelValidation="True"
            AllowPaging="True" CellPadding="4" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px" ForeColor="#333333" GridLines="None">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>