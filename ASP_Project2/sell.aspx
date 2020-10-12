<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="sell.aspx.cs" Inherits="sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        
        <br />
        <div id="algincenter">

            <fieldset class="py-4" style ="border : solid #996600; background-color:#f5f6f7">
                <div class="row">
                <%--row를 선언 후 col를 이용하여 여백을 나타낸다. --%>
                <div class="col-1"></div>
                <%--총 12개의 md중 2개의 크기를 가장 왼쪽에 부여(2개의 크기만큼 여백) --%>
                <div class="col-11">
                    <%--총 12개의 md중 8개의 크기를 로고 사용에 지정 --%>
                
                
                <asp:TextBox ID="title" runat="server" Placeholder="제목을 입력하세요" CssClass="sell_right" Width="76%"></asp:TextBox>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="15%">
                    <asp:ListItem Value="0" Selected>공개설정</asp:ListItem>
                    <asp:ListItem Value="1">전체공개</asp:ListItem>
                    <asp:ListItem Value="2">회원공개</asp:ListItem>
                </asp:DropDownList>
                <p></p>

                <asp:TextBox ID="contents" runat="server" TextMode="MultiLine" Height="500px" Width="91%" CssClass="sell_content_left"
                    Placeholder="내용을 입력하세요"></asp:TextBox>
                <p></p>
                <table>
                    <tr><td>
<asp:Label ID="Label2" runat="server" Text="사 진" CssClass="sell_left" width="70px" ></asp:Label>
                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sell_right"  Width="80%" /> <p></p>
                <asp:Label ID="Label7" runat="server" Text="판매가격" CssClass="sell_tag_left" Width="70px" ></asp:Label>
                <asp:TextBox ID="price" runat="server" CssClass="sell_tag_middle text-right" Width="75%" BackColor="#E6E6E6" BorderColor="#CCCCCC" BorderWidth="1px" ></asp:TextBox>
                 <asp:Label ID="Label1" runat="server" Text="원"></asp:Label>
                        </td><td>
<asp:Button ID="Cancel" runat="server" Text="취소" Height="5%" Width="25%" CssClass="signup_data_btn1" OnClick="Cancel_Click" />
            <asp:Button ID="Upload" runat="server" Text="확인" Height="5%" Width="25%" CssClass="signup_data_btn2" OnClick="btnWrite_Click" />
           
                             </td></tr>
                </table>
                
                    </div>
                    
                    </div>
                </fieldset>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

