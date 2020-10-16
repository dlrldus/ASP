<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="mypage_Note.aspx.cs" Inherits="ASP_Project2_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ImageButton runat="server" imageAlign="Middle" ImageUrl="~/ASP_Project2/icon/email.png" Width="110px" Height="110px" />
        <asp:Label runat="server" Text="내쪽지함" Font-Size="26pt" Font-Bold="True"></asp:Label><br />
    <asp:Label runat="server" ID="testlbl"></asp:Label>
    <asp:GridView ID="Note_grid" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
        AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="100%">
        <Columns>
            <asp:BoundField DataField="toUser" ItemStyle-Width="10%" HeaderText="보낸이" />
            <asp:BoundField DataField="fromUser" ItemStyle-Width="10%" HeaderText="받는이" />
            <%--<asp:BoundField DataField="contents" SortExpression="comment" ItemStyle-Width="60%" HeaderText="내용"/>--%>
            <asp:TemplateField HeaderText="내용" ItemStyle-Width="50%">
                <ItemTemplate>
                    <a href="<%# "sellpost_View.aspx?No=" + Eval("postnumber")%>"><%# Eval("contents") %></a>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="writedate" HeaderText="보낸날짜" />


        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

