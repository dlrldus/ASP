<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="reportform.aspx.cs" Inherits="reportform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="container">

        <br />
        <div id="algincenter">
            <asp:Label ID="Label1" runat="server" Text="신고글 작성" Font-Bold="True" Font-Size="42pt"></asp:Label>
            <fieldset class="py-4" style="border: solid #996600; background-color: #f5f6f7">
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-11">
                           <asp:DropDownList ID="DropDownList1" runat="server" Width="20%">
                            <asp:ListItem Value="0" Selected="True">신고 분류</asp:ListItem>
                            <asp:ListItem Value="1">사기 피해</asp:ListItem>
                            <asp:ListItem Value="2">상습적 거래취소</asp:ListItem>
                            <asp:ListItem Value="3">허위 매물</asp:ListItem>
                            <asp:ListItem Value="4">욕설</asp:ListItem>
                            <asp:ListItem Value="5">기타</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="title" runat="server" Placeholder="제목을 입력하세요" CssClass="sell_right" Width="76%"></asp:TextBox><br /><br />
                        <asp:TextBox ID="contents" runat="server" TextMode="MultiLine" Height="500px" Width="96%" CssClass="sell_content_left" Placeholder="내용을 입력하세요">대상 아이디 :

게시글 번호 :

신고 내용 :




신고 사진 :
                        </asp:TextBox>

                         <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="사 진" CssClass="sell_left" Width="70px"></asp:Label>
                                    <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sell_right" Width="80%" />
                                    <p></p>
                                </td>
                                <td>
                                    <asp:Button ID="Cancel" runat="server" Text="취소" Height="5%"  CssClass="signup_data_btn1" OnClick="Cancel_Click" />
                                    <asp:Button ID="Upload" runat="server" Text="확인" Height="5%"  CssClass="signup_data_btn2" OnClick="btnWrite_Click" />

                                </td>
                            </tr>
                        </table>

                        </div>

                </div>
            </fieldset>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

