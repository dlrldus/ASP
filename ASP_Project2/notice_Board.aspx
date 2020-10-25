<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="notice_Board.aspx.cs" Inherits="ASP_Project2_Default2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ImageButton runat="server" imageAlign="Middle" ImageUrl="~/ASP_Project2/icon/announcement.png" Width="110px" Height="110px" />
        <asp:Label runat="server" Text="공지사항" Font-Size="26pt" Font-Bold="True"></asp:Label><br />
    <asp:GridView ID="notice_grid" runat="server" AutoGenerateColumns="False"
        AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="100%">
        <Columns>

            <asp:BoundField DataField="num" SortExpression="nickname" />
            <asp:BoundField DataField="name" SortExpression="comment" />
            <%--ItemStyle-Width="80%" --%>
            <asp:TemplateField HeaderText="제목" ItemStyle-Width="70%">
                <ItemTemplate>
                    <a href="<%# "notice_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                </ItemTemplate>
                <HeaderStyle Width="250px" CssClass="PostHeader" />
                <ItemStyle Width="30%"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="contents" SortExpression="writedate" />
            <asp:BoundField DataField="readcount" SortExpression="writedate" />
            <asp:BoundField DataField="writedate" SortExpression="writedate" />
        </Columns>

    </asp:GridView>
</asp:Content>

