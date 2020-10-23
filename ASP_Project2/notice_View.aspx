<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="notice_View.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField runat="server" ID="post_num" />
    <div id="req_View_Container">
        <div id="top_Btn">
            <%--상단 수정,삭제 버튼--%>
            <asp:Button ID="Button3" runat="server" Text="삭제" CssClass="View_BtnD" />
            <asp:Button ID="Button2" runat="server" Text="수정" CssClass="View_BtnM" OnClick="Update_Btn_Click"/><br />
            <br />
        </div> 
        <asp:Table runat="server" Width="100%" Height="400px" CssClass="table">
        <%--<table border="1" style="width: 100%">--%>
        <%--<div id="View_header"> --%>  
            <%--제목--%>
          <asp:TableRow runat="server">
              <asp:TableCell runat="server" CssClass="column_text"><asp:Label runat="server" Text="제목" CssClass="request_label_text"></asp:Label></asp:TableCell>
              <asp:TableCell runat="server" ColumnSpan="3"><asp:TextBox ID="title" runat="server" CssClass="request_title_textbox" ReadOnly="true"></asp:TextBox></asp:TableCell>
         </asp:TableRow>
            <%--작성자 작성일 조회수 --%>
          <asp:TableRow runat="server">
              <asp:TableCell runat="server" CssClass="column_text"><asp:Label runat="server" Text="작성자" CssClass="request_label_text"></asp:Label></asp:TableCell>
              <asp:TableCell runat="server" ColumnSpan="3"><asp:Label ID="nickname" runat="server" Text="" CssClass="content_text"></asp:Label></asp:TableCell>
         </asp:TableRow>

          <asp:TableRow runat="server">
            <asp:TableCell runat="server" CssClass="column_text"><asp:Label ID="lblDate" runat="server" Text="작성일" CssClass="request_label_text"></asp:Label></asp:TableCell>
            <asp:TableCell runat="server"><asp:Label ID="writeday" runat="server" Text="" CssClass="content_text"></asp:Label></asp:TableCell>

           <asp:TableCell runat="server" CssClass="column_text"><asp:Label ID="lblCount" runat="server" Text="조회수" CssClass="request_label_text"></asp:Label></asp:TableCell>
           <asp:TableCell runat="server"><asp:Label ID="readcount" runat="server" Text="" CssClass="content_text"></asp:Label></asp:TableCell>
        </asp:TableRow>
            <%--</div>--%>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server" ColumnSpan="4">
              <div id="View_Contents">
                  <asp:Image runat="server" ID="imageout" Width="300px" Height="180px" />
                  <asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="True" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox>
              </div>
           </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
        <div id="View_Btn_loc_view">
            <%--<asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn" />--%>
            <asp:Button ID="Button4" runat="server" Text="목록보기" CssClass="View_BtnL" onClick="back_board_Btn"/>
        </div>
        <hr style="border: 1px double #cccaca; width: 100%;"/>
        <%--</div>--%>
        <br />
        <br />
        <%--<div id="View_Btn_loc">
            주석줄<asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn" />
            <asp:Button ID="Button1" runat="server" Text="목록보기" CssClass="View_Btn" onClick="back_board_Btn"/>
        </div>--%>
    </div>
</asp:Content>