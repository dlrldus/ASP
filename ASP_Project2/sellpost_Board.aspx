<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="sellpost_Board.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="imageboard">
        <%--검색기능--%>
        <asp:ImageButton ImageUrl="icon/book.png" Width="160px" Height="110px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="구매게시판" Font-Size="42pt" Font-Bold="True"></asp:Label><br />
        <br />
        <div id="search_div">
            <asp:DropDownList ID="search_object" runat="server" Height="45px" Width="17%">
                <asp:ListItem Value="title">제목</asp:ListItem>
                <asp:ListItem Value="name">작성자</asp:ListItem>
                <asp:ListItem Value="contents">내용</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="SearchBox" runat="server" TextMode="SingleLine" placeholder="검색할 내용을 입력해주세요." CssClass="section_search_textbox" BorderWidth="0" Width="70%" Height="45px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" ImageUrl="icon/search.png" OnClick="Search_Click" Width="45px" Height="45px" runat="server" ImageAlign="AbsMiddle" />
        </div>

        <br />
        <%--카테고리 영역--%>
        <table border="1" style="width: 100%; height: 300px;">
            <tr>
                <td>

                </td>
            </tr>
            <tr>
                <td>

                </td>
            </tr>
            <tr>
                <td>

                </td>
            </tr>
        </table>
        <br />
        <%-- 데이터 바인딩 --%>
        <asp:DataList ID="sellpost" runat="server" RepeatColumns="1" RepeatDirection="Vertical" CellPadding="10" CellSpacing="10" HorizontalAlign="Center" GridLines="Both" Width="100%" ItemStyle-Width="300px" ItemStyle-VerticalAlign="Middle" RepeatLayout="Table" ItemStyle-BorderStyle="None" BorderStyle="None">
            <ItemTemplate>
                <table border="1" style="padding: 5px; text-align: center;">
                    <tr>
                        <td rowspan="4" style="width: 13%; height: 180px">
                            <a href="<%# "sellpost_View.aspx?No=" + Eval("num")%>">
                                <asp:Image ID="recentImg" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Width="100%" Height="100%" ImageAlign="Middle" /></a></td>
                        <td style="width: 200px; height: 25px">제목
                        </td>
                        <td style="width: 200px; height: 25px">가격
                        </td>
                        <td style="width: 200px; height: 25px">책 품질
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px; height: 40px; text-align:left;">
                            <a href="<%# "sellpost_View.aspx?No=" + Eval("num")%>"><%# Eval("title") %></a>
                            <asp:HiddenField runat="server" ID="pay_code_che" />
                            <asp:ImageButton Visible='<%#User.Identity.IsAuthenticated %>' ID="NewIcon" runat="server" ImageUrl="icon/newicon1.jpg" Height="15px" Width="15px" />
                            <asp:ImageButton Visible='<%#User.Identity.IsAuthenticated %>' ID="dealing_img" runat="server" ImageUrl="icon/price-tag-1.png" Height="20px" Width="20px" />
                        </td>
                        <td style="width: 200px; height: 40px">
                            <%# Eval("price") %> 원
                        </td>
                        <td style="width: 200px; height: 40px">
                            <%# Eval("status") %>
                        </td>
                    </tr>
                    <tr>
                        <td>게시글 내용
                        </td>
                        <td>거래상태
                        </td>
                        <td>작성일자
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 70%; height: 100px; text-align: left;">
                            <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("contents").ToString().Substring(0, 7)+"..." %>'></asp:Label>    --%>
                            <%# Eval("contents")%>
                        </td>
                        <td>
                            <%# Eval("pay_code")%>
                        </td>
                        <td>
                            <%# Eval("writedate")%>
                        </td>
                    </tr>

                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:Label runat="server" ID="test1"></asp:Label>
        <asp:Label runat="server" ID="test2"></asp:Label>
        <asp:Label runat="server" ID="test3"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>


