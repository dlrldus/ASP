<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="user_mylist.aspx.cs" Inherits="ASP_Project2_Default2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
        <asp:ImageButton runat="server" imageAlign="Middle" ImageUrl="~/ASP_Project2/icon/list.png" Width="110px" Height="110px" />
        <asp:Label runat="server" Text="내 게시글" Font-Size="26pt" Font-Bold="True"></asp:Label><br />
    <asp:GridView ID="myPost" runat="server" AutoGenerateColumns="False" DataKeyNames="num"
        AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px">
        <Columns>
            <asp:BoundField DataField="num" HeaderText="게시글번호" />
            <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                <ItemTemplate>
                    <a href="<%# "sellpost_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                </ItemTemplate>
                <HeaderStyle Width="250px" />
                <ItemStyle Width="50%"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="writedate" HeaderText="작성일" />
            <asp:BoundField DataField="readcount" HeaderText="조회수" />
        </Columns>
        <EmptyDataRowStyle BorderStyle="Double" />
        <HeaderStyle BorderStyle="None" />
    </asp:GridView>
</asp:Content>


