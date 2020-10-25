<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="report_Board.aspx.cs" Inherits="report_Board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="imageboard">

        
        <asp:ImageButton ImageUrl="images/cat1.jpg" Width="160px" Height="110px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="신고게시판" Font-Size="42pt" Font-Bold="True"></asp:Label><br />
        <br />
        
        

        <br />
        <asp:Button ID="ReportWrite" runat="server" Text="신고글 작성" CssClass="section_user_button" OnClick="ReportWrite_Click"   />
            <asp:GridView ID="requestpost_View"  GridLines="Horizontal" runat="server" AutoGenerateColumns="False" DataKeyNames="num"
            AllowPaging="True" BackColor="White" BorderColor="Black" BorderStyle="none" AllowSorting="True" HorizontalAlign="Center" Width="90%" CssClass="table table-hover" CellPadding="4" Font-Size="13pt" > <%--onrowdatabound="requestpost_View_RowDataBound"--%>
            <HeaderStyle BackColor="#cfa484" Font-Bold="True" />
            <Columns>
                <asp:BoundField DataField="name" HeaderText="작성자" HeaderStyle-CssClass="PostHeader" >
                </asp:BoundField>
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="70%">
                    <ItemTemplate>
                        <a href="<%# "request_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" CssClass="PostHeader" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="writedate" HeaderText="작성일" HeaderStyle-CssClass="PostHeader" >
                </asp:BoundField>
            </Columns>
            </asp:GridView>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

