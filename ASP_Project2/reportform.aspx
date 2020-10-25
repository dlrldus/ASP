<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="reportform.aspx.cs" Inherits="reportform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="container">

        <br />
        <div id="algincenter">
            <asp:Label ID="Label1" runat="server" Text="신고글 작성" Font-Bold="True" Font-Size="42pt"></asp:Label>
            <asp:Table ID="Table1" runat="server" CssClass="table">
                <asp:TableRow>
                    <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label2" runat="server" Text="작성자"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="nickname" runat="server" ReadOnly="true" Height="30px" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label3" runat="server" Text="이메일"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="email" runat="server" ReadOnly="True" Height="30px" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                             <asp:TableCell CssClass="column_text">
                                 <asp:Label ID="Label4" runat="server" Text="제목"></asp:Label>
                             </asp:TableCell>
                             <asp:TableCell>
                                 <asp:TextBox ID="title" runat="server" Placeholder="제목을 입력하세요" Width="70%"></asp:TextBox>
                             </asp:TableCell>
                         </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label5" runat="server" Text="신고 사유"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="0" Selected="True">사기 피해</asp:ListItem>
                            <asp:ListItem Value="1">상습적 거래취소</asp:ListItem>
                            <asp:ListItem Value="2">허위 매물</asp:ListItem>
                            <asp:ListItem Value="3">욕설</asp:ListItem>
                            <asp:ListItem Value="4">기타</asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label6" runat="server" Text="사진 첨부"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="request_right" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="column_text">
                        <asp:Label ID="Label7" runat="server" Text="내용"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="500px" Width="100%" Placeholder="내용을 입력하세요"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="Button1" runat="server" Text="취소" Height="50px" Width="12%" CssClass="request_button_cancle" />
            <asp:Button ID="Button2" runat="server" Text="확인" Height="50px" Width="12%" CssClass="request_button_apply"/>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

