<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="request_Board.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="imageboard">
        <asp:ImageButton ImageUrl="~/ASP_Project2/Images/img.PNG" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="요청게시판" Font-Size="30pt" Font-Bold="True"></asp:Label><br />
        <br />
        <table border="1" id="request_table">
            <tr>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="전체" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="All" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="서울" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Seoul" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="경기" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gyeonggi" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="인천" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Incheon" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="강원" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gangwon" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="충북" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Chungbug" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="충남" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Chungnam" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="전북" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Jeonbug" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="전남" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Jeonnam" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="경북" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gyeongbug" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="경남" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Gyeongnam" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="대구" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Daegu" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="부산" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Busan" /></td>
                <td>
                    <asp:Button runat="server" BackColor="#88563f" BorderStyle="None" Text="제주" Font-Overline="False" ForeColor="White" Height="100%" Width="100%" OnClick="Jeju" /></td>
            </tr>
        </table>
        <asp:GridView ID="requestpost_View" runat="server" AutoGenerateColumns="False" DataKeyNames="num"  EnableModelValidation="True"
            AllowPaging="True" CellPadding="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="true" HorizontalAlign="Center" Width="90%" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="num" HeaderText="게시글번호" />
                <asp:BoundField DataField="Location" HeaderText="지역" />
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="40%">
                    <ItemTemplate>
                        <a href="<%# "request_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" CssClass="PostHeader" />
                    <ItemStyle Width="40%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="price" HeaderText="희망가격" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="name" HeaderText="작성자" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="writedate" HeaderText="작성일" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="readcount" HeaderText="조회수" HeaderStyle-CssClass="PostHeader" />
            </Columns>
            </asp:GridView>
       
        <%--검색창--%>
        <div id="search_div">
            <asp:DropDownList ID="search_object" runat="server" Height="67px" Width="20%">
                <asp:ListItem Value="title">제목</asp:ListItem>
                <asp:ListItem Value="name">작성자</asp:ListItem>
                <asp:ListItem Value="contents">내용</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="SearchBox" runat="server" TextMode="SingleLine" placeholder="검색할 내용을 입력해주세요." CssClass="section_search_textbox" BorderWidth="0" Width="67%" Height="67px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" ImageUrl="icon/search.png" OnClick="Search_Click" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        </div>
  
        <asp:Button ID="up_request" runat="server" Text="글 올리기" CssClass="View_Btn" OnClick="up_request_Click" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

