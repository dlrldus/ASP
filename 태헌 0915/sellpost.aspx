<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="sellpost.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="imageboard">
        <%--검색기능--%>
        <asp:ImageButton ImageUrl="icon/book.png" Width="160px" Height="110px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="구매게시판" Font-Size="42pt" Font-Bold="True"></asp:Label><br />
        <br />
        <div id="search_div">
            <asp:DropDownList ID="search_object" runat="server" Height="67px" Width="10%">
                <asp:ListItem Value="title">제목</asp:ListItem>
                <asp:ListItem Value="name">작성자</asp:ListItem>
                <asp:ListItem Value="contents">내용</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="SearchBox" runat="server" TextMode="SingleLine" placeholder="검색할 내용을 입력해주세요." CssClass="section_search_textbox" BorderWidth="0" Width="78%" Height="67px"></asp:TextBox>
            <%--<asp:Button runat="server" Text="검색" CssClass="post_search_button" OnClick="Search_Click" />--%>
        </div>
        <asp:ImageButton ID="ImageButton1" ImageUrl="icon/search.png" OnClick="Search_Click" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <br />
        <asp:GridView ID="sellpost" runat="server" AutoGenerateColumns="False" DataKeyNames="num"
            AllowPaging="True" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" HorizontalAlign="Center" Width="100%" OnPageIndexChanging="sellpost_PageIndexChanging" OnRowDataBound="sellpost_RowDataBound" OnRowCreated="sellpost_OnRowCreated">
            <Columns>
                <asp:BoundField DataField="num" HeaderText="게시글번호" HeaderStyle-CssClass="PostHeader"/>
               <%-- <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center" Width="60px" VerticalAlign="Middle"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblIndex" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <%---- 순차적용
                <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                <asp:BoundField DataField="name" HeaderText="작성자" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="email" HeaderText="이메일" HeaderStyle-CssClass="PostHeader" />
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        
                        <a href="<%# "View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                        <asp:HiddenField runat="server" ID="che_wri" />
                        <asp:HiddenField runat="server" ID="pay_code_che" />
                        <%--테 스 트 용 라 벨--%>
                        <%--<asp:Label runat="server" ID="testlbl"></asp:Label>--%>
                        <asp:ImageButton Visible='<%#User.Identity.IsAuthenticated %>' ID="NewIcon" runat="server" ImageUrl="icon/newicon.jpg" Height="15px" Width="15px" />
                        <asp:ImageButton Visible='<%#User.Identity.IsAuthenticated %>' ID="dealing_img" runat="server" ImageUrl="icon/dealing.png" Height="30px" Width="90px" />
                    </ItemTemplate>
                    <HeaderStyle Width="250px" CssClass="PostHeader" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="price" HeaderText="가격" HeaderStyle-CssClass="PostHeader" DataFormatString="{0:#,###} 원" />
                <asp:BoundField DataField="writedate" HeaderText="작성일" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="readcount" HeaderText="조회수" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="pay_code" HeaderText="" HeaderStyle-CssClass="PostHeader" FooterStyle-Wrap="False" HeaderStyle-BorderWidth="0" HeaderStyle-BorderColor="White" />
            </Columns>
        </asp:GridView>
        <asp:Label runat="server" ID="test1"></asp:Label>
        <asp:Label runat="server" ID="test2"></asp:Label>
        <asp:Label runat="server" ID="test3"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>
