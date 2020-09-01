<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" ValidateRequest="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="mainpop">
       <asp:DataList ID="RecentBook" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" DataSourceID="MainpostData" CellPadding="10" CellSpacing="15" HorizontalAlign="Center" GridLines="both" Width="100%" ItemStyle-Width="300px" ItemStyle-VerticalAlign="Middle">
            <HeaderStyle BackColor="#ffcc99" Font-Size="20pt"/>
            <HeaderTemplate>
                <center><b>오늘 들어온 책</b></center>
            </HeaderTemplate>
            <ItemTemplate>
                <a href="<%# "View.aspx?No=" + Eval("num")%>">
                <asp:Image ID="recentImg" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Width="100%" Height="300px" ImageAlign="Middle" /></a><br />
                <!--제목-->
                 <asp:label runat="server" Text=" 책 제목 : " ></asp:label> <%# Eval("title") %><br />
                <!--작성자--> 
                 <asp:label runat="server" Text=" 작성자 : " ></asp:label><%# Eval("name") %> <br />
            </ItemTemplate>
            <%--<AlternatingItemTemplate>
                <div style="background-color: beige;">
                    <a href="<%# "View.aspx?No=" + Eval("num")%>">
                 <asp:Image ID="recentImg" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Width="100%" Height="400px" /></a><br />
                <!--제목--> <%# Eval("title") %> <br />
                <!--작성자--> <%# Eval("name") %> <br />
                </div>
            </AlternatingItemTemplate>--%>
        </asp:DataList> 
        <asp:SqlDataSource ID="MainpostData" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString %>" SelectCommand="SELECT TOP (5) [num], [name], [title], [image], [price] FROM [sellpost] ORDER BY [num] DESC"></asp:SqlDataSource>
    </div>

    <br />
    <div id="main_D_Left">
        <div>
            <table border="1" style="text-align: center; margin: auto; width: 95%; height: 600px;">
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
        <asp:GridView ID="sellpostMain" runat="server" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource2" EnableModelValidation="True"
            AllowPaging="True" CellPadding="4" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="num" SortExpression="num" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" HeaderStyle-Width="40%" InsertVisible="False" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader" Width="40%"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="title" SortExpression="title" />
                <asp:BoundField DataField="name" SortExpression="name" />
                <asp:BoundField DataField="writedate" SortExpression="writedate" />
                <asp:BoundField DataField="readcount" SortExpression="readcount" />
                <asp:BoundField DataField="price" SortExpression="price" />
            </Columns>
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" BorderStyle="None" />
            <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString9 %>" SelectCommand="SELECT TOP (5) [num], [title], [name], [writedate], [readcount], [price] FROM [sellpost] ORDER BY [num]"></asp:SqlDataSource>
    </div>
    <%--메인 최신글 - 요청게시글--%>
    <div id="main_D_Right_D">
        <div id="Main_Board_Label">
            <asp:Label runat="server" Text="최신요청글" CssClass="Main_Board_Label"></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource3" EnableModelValidation="True"
            AllowPaging="True" CellPadding="4" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="num" SortExpression="num" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" HeaderStyle-Width="40%" InsertVisible="False" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader" Width="40%"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="title" SortExpression="title" />
                <asp:BoundField DataField="name" SortExpression="name" />
                <asp:BoundField DataField="writedate" SortExpression="writedate" />
                <asp:BoundField DataField="readcount" SortExpression="readcount" />
                <asp:BoundField DataField="price" SortExpression="price" />
            </Columns>
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString10 %>" SelectCommand="SELECT TOP (5) [num], [title], [name], [writedate], [readcount], [price] FROM [requestpost] ORDER BY [num]"></asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

  <%-- 메인페이지 최근 글 5개
        <table border="1" style="width: 100%; height: 350px; table-layout: fixed;">
            <tr>
                <td>
                    <a href="<%# "View.aspx?No=" + Eval("num")%>"><asp:Image runat="server" ID="image1" Width="100%" Height="320px" /></a>
                </td>
                <td>
                    <asp:Image runat="server" ID="image2" Width="100%" Height="320px" />
                </td>
                <td>
                    <asp:Image runat="server" ID="image3" Width="100%" Height="320px" />
                </td>
                <td>
                    <asp:Image runat="server" ID="image4" Width="100%" Height="320px" />
                </td>
                <td>
                    <asp:Image runat="server" ID="image5" Width="100%" Height="320px" />
                </td>
            </tr>
            <tr>
                <td style="height: 100px; text-align: center;">
                    <asp:Label runat="server" ID="title1"></asp:Label>
                </td>
                <td style="height: 100px; text-align: center;">
                    <asp:Label runat="server" ID="title2"></asp:Label>
                </td>
                <td style="height: 100px; text-align: center;">
                    <asp:Label runat="server" ID="title3"></asp:Label>
                </td>
                <td style="height: 100px; text-align: center;">
                    <asp:Label runat="server" ID="title4"></asp:Label>
                </td>
                <td style="height: 100px; text-align: center;">
                    <asp:Label runat="server" ID="title5"></asp:Label>
                </td>
            </tr>
        </table>--%>