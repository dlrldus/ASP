<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="notice_Modify.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField runat="server" ID="post_num" />
    <div id="req_View_Container">
        <div id="top_Btn">
            <br />
            <br />
        </div>
        <%--<div id="View_header">--%>
            <asp:Table ID="Table1" runat="server" CssClass="table">
            <%--제목--%>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                        <asp:Label runat="server" Text="제목" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell ColumnSpan="3">
                        <asp:TextBox ID="title" runat="server" CssClass="title_mtextbox" ReadOnly="False"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            <%--작성자 작성일 조회수 --%>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                         <asp:Label runat="server" Text="작성자" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell ColumnSpan="3">
                        <asp:Label ID="nickname" runat="server" Text="" CssClass="request_label_text"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                        <asp:Label ID="lblDate" runat="server" Text="작성일" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell>
                        <asp:Label ID="writeday" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableHeaderCell CssClass="column_text">
                        <asp:Label ID="lblCount" runat="server" Text="조회수" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell>
                        <asp:Label ID="readcount" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                        <%--<asp:Label ID="Label3" runat="server" Text="사진 첨부" CssClass="sell_left"></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text="사진 첨부" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell ColumnSpan="3">
                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="request_right" Height="60%" />
                    </asp:TableCell>
                </asp:TableRow>  
        <%--<br />
            <br />
        </div>--%>
        <%--<div id="View_Contents">--%>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                        <asp:Label ID="Label1" runat="server" Text="내용" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell ColumnSpan="3"> 
                        <div id="modify_content">
                        <asp:Image runat="server" ID="imageout" Width="300px" Height="200px" />
                        <asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="False" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
        <%-- <br />
        </div>--%>
        </asp:Table>
        <hr style="border: 1px double #cccaca; width: 100%;"/>
         <div id="View_Btn_loc">
            <asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn_up" OnClick="Update_Btn"/>
            <asp:Button ID="Button1" runat="server" Text="취소" CssClass="View_BtnC" OnClick="back_board_Btn" />
        </div>  
        <%-------------------------댓글창------------------------%>
        </div>
        <br />
        <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>
