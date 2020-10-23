<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="QnA_Board.aspx.cs" Inherits="QnA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <div id="imageboard">
        
        
        <asp:ImageButton ImageUrl="images/cat1.jpg" Width="160px" Height="110px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="1대 1 문의" Font-Size="42pt" Font-Bold="True"></asp:Label><br />
        <br />
        
        

        <br />
        <asp:Button ID="QnaWrite" runat="server" Text="문의글 작성" OnClick="QnaWrite_Click" CssClass="section_user_button"   />
        <%--카테고리 영역--%>
        <asp:GridView ID="requestpost_View"  GridLines="Horizontal" runat="server" AutoGenerateColumns="False" DataKeyNames="num"
            AllowPaging="True" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="90%" CssClass="table table-hover" CellPadding="4" Font-Size="13pt" > <%--onrowdatabound="requestpost_View_RowDataBound"--%>
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
        <br />
        <%-- 데이터 바인딩 --%>
        
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

