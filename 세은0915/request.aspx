<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="request.aspx.cs" Inherits="request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
 
    <div class="container">

        <div id="algincenter">
            <%--<fieldset class="py-4">--%>
            <asp:Label ID="Label12" runat="server" Text="도서 요청 글 작성" CssClass="text_requestform"></asp:Label>
                <asp:Table ID="Table1" runat="server" CssClass="table">
                     <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                            <asp:DropDownList ID="Sel_location"  AutoPostBack="true" runat="server" Height="50px" Width="20%"> <%--OnSelectedIndexChanged="Loc_ChangeIndex"--%>
                                <asp:ListItem >지역선택</asp:ListItem>
                                <asp:ListItem >서울</asp:ListItem>
                                <asp:ListItem >경기</asp:ListItem>
                                <asp:ListItem >인천</asp:ListItem>
                                <asp:ListItem >강원</asp:ListItem>
                                <asp:ListItem >충북</asp:ListItem>
                                <asp:ListItem >충남</asp:ListItem>
                                <asp:ListItem >전북</asp:ListItem>
                                <asp:ListItem >전남</asp:ListItem>
                                <asp:ListItem >경북</asp:ListItem>
                                <asp:ListItem >경남</asp:ListItem>
                                <asp:ListItem >대구</asp:ListItem>
                                <asp:ListItem >부산</asp:ListItem>
                                <asp:ListItem >제주</asp:ListItem>
                            </asp:DropDownList>
                            <asp:HiddenField runat="server" ID="location" />
                            <asp:HiddenField runat="server" ID="loc_code" />
                            <p></p>
                        </asp:TableCell>
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
                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sell_right" Height="60%" />
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
                   <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label4" runat="server" Text="공개설정" CssClass="sell_left"></asp:Label>
                   </asp:TableCell>
                   <asp:TableCell>
                        <asp:Label ID="Label7" runat="server" Text="전체공개" CssClass="sell_radio_right"></asp:Label>&nbsp;
                        <asp:RadioButton ID="gopub_all" runat="server" CssClass="sell_radio_right" GroupName="go_public" Checked="True"></asp:RadioButton>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label8" runat="server" Text="멤버공개" CssClass="sell_radio_right"></asp:Label>&nbsp;
                        <asp:RadioButton ID="gopub_mem" runat="server" CssClass="sell_radio_right" GroupName="go_public"></asp:RadioButton>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label9" runat="server" Text="비공개" CssClass="sell_radio_right"></asp:Label>&nbsp;
                        <asp:RadioButton ID="gopub_none" runat="server" CssClass="sell_radio_right" GroupName="go_public"></asp:RadioButton>
                        <asp:HiddenField runat="server" ID="gopub" />
                   </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="column_text">
                 <asp:Label ID="Label10" runat="server" Text="희망가격" CssClass="sell_left"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                <asp:TextBox ID="hopeprice" runat="server" CssClass="sell_tag_right"></asp:TextBox>
                        <asp:Label ID="Label13" runat="server" Text="Label">&nbsp;원</asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2"></asp:TableCell>
                </asp:TableRow>
            <%--</fieldset>--%>
                </asp:Table>
            <asp:Button ID="Button1" runat="server" Text="취소" Height="50px" Width="100px" CssClass="sell_button_cancle" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="확인" Height="50px" Width="100px" CssClass="sell_button_apply" OnClick="Button2_Click" />
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

