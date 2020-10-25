<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="notice_Write.aspx.cs" Inherits="request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
 
    <div class="container">

        <div id="algincenter">
            <%--<fieldset class="py-4">--%>
            <asp:Label ID="Label12" runat="server" Text="공지사항" CssClass="text_requestform"></asp:Label>
                <asp:Table ID="Table1" runat="server" CssClass="table">
                     <asp:TableRow>
                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell CssClass="column_text">
                            <asp:Label ID="Label5" runat="server" Text="작성자" CssClass="sell_left"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="nickname" runat="server" ReadOnly="True" Height="30px" BorderStyle="None"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell CssClass="column_text">
                            <asp:Label ID="Label6" runat="server" Text="이메일" CssClass="sell_left"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="email" runat="server" ReadOnly="True" Height="30px" BorderStyle="None"></asp:TextBox>
                        </asp:TableCell>
                </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label1" runat="server" Text="제목" CssClass="sell_left"></asp:Label>
                   </asp:TableCell>
                   <asp:TableCell>
                        <asp:TextBox ID="title" runat="server" Placeholder="게시글 제목을 입력하세요" Width="70%"></asp:TextBox>
                   </asp:TableCell>
               </asp:TableRow>
                
               <asp:TableRow>
                   <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label2" runat="server" Text="사진 첨부" CssClass="sell_left"></asp:Label>
                   </asp:TableCell>
                   <asp:TableCell>
                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="request_right" Height="60%" />
                   </asp:TableCell>
               </asp:TableRow>
               
               <asp:TableRow>
                   <asp:TableCell CssClass="column_text">
                       <asp:Label ID="Label11" runat="server" Text="내용" CssClass="sell_left"></asp:Label>
                   </asp:TableCell>
                   <asp:TableCell>
                        <asp:TextBox ID="content" runat="server" TextMode="MultiLine" Height="500px" Width="100%" CssClass="sell_content_left"></asp:TextBox>
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label3" runat="server" Text="태그" CssClass="sell_tag_left"></asp:Label>  
                   </asp:TableCell>
                   <asp:TableCell>
                        <asp:TextBox ID="tag" runat="server" CssClass="sell_tag_right"></asp:TextBox>
                   </asp:TableCell>
               </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2"></asp:TableCell>
                </asp:TableRow>
            <%--</fieldset>--%>
                </asp:Table>
            <asp:Button ID="Button1" runat="server" Text="취소" Height="50px" Width="100px" CssClass="request_button_cancle"  />
            <asp:Button ID="Button2" runat="server" Text="확인" Height="50px" Width="100px" CssClass="request_button_apply" OnClick="Button2_Click" />
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

