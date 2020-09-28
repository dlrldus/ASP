<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="request_Board.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="imageboard">
        <asp:ImageButton ImageUrl="icon/mega.png" Width="160px" Height="110px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="요청게시판" Font-Size="26pt" Font-Bold="True"></asp:Label><br />
        <ul style="list-style-type:square; font-size:25pt; margin-left:5%">
            <li><asp:Label runat="server" Text="지역별 보기" Font-Size="18pt" Font-Bold="True"></asp:Label><br /> </li>
        </ul>
        <table border="1" id="request_table">
            <tr>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="전체" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="All" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="서울" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Seoul" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="경기" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gyeonggi" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="인천" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Incheon" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="강원" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gangwon" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="충북" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Chungbug" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="충남" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Chungnam" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="전북" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Jeonbug" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="전남" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Jeonnam" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="경북" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gyeongbug" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="경남" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gyeongnam" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="대구" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Daegu" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="부산" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Busan" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#796D6D" BorderStyle="None" Text="제주" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Jeju" /></td>
            </tr>
        </table>
        <asp:GridView ID="requestpost_View"  GridLines="none" runat="server" AutoGenerateColumns="False" DataKeyNames="num"
            AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="90%" CssClass="table table-hover" CellPadding="4" Font-Size="13pt"> <%--onrowdatabound="requestpost_View_RowDataBound"--%>
            <HeaderStyle BackColor="#f2f2f2" Font-Bold="True" />
            <Columns>
                <asp:BoundField DataField="num" HeaderText="번호" />
                <asp:BoundField DataField="Location" HeaderText="지역" />
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="70%">
                    <ItemTemplate>
                        <a href="<%# "request_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" CssClass="PostHeader" />
                    <ItemStyle Width="30%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="price" HeaderText="희망가격" HeaderStyle-CssClass="PostHeader" DataFormatString="{0:#,###} 원">
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="작성자" HeaderStyle-CssClass="PostHeader" >
                </asp:BoundField>
                <asp:BoundField DataField="writedate" HeaderText="작성일" HeaderStyle-CssClass="PostHeader" >
                </asp:BoundField>
                <asp:BoundField DataField="readcount" HeaderText="조회수" HeaderStyle-CssClass="PostHeader" >
                </asp:BoundField>
            </Columns>
            </asp:GridView>
        <asp:Button ID="up_request" runat="server" Text="글 올리기" CssClass="View_Btn_up" OnClick="up_request_Click" />
        <%--검색창--%>
        <div id="search_div">
            <asp:DropDownList ID="search_object" runat="server" Height="45px" Width="17%">
                <asp:ListItem Value="title">제목</asp:ListItem>
                <asp:ListItem Value="name">작성자</asp:ListItem>
                <asp:ListItem Value="contents">내용</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="SearchBox" runat="server" TextMode="SingleLine" placeholder="검색할 내용을 입력해주세요." CssClass="section_search_textbox" BorderWidth="0" Width="70%" Height="45px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" ImageUrl="icon/search.png" OnClick="Search_Click" Width="45px" Height="45px" runat="server" ImageAlign="AbsMiddle" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

