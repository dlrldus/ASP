<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField runat="server" ID="post_num" />
    <div id="View_Container">
        <div id="top_Btn">
            <br />
            <br />
        </div>
        <div id="View_header">
            <%--제목--%>
            <asp:Label runat="server" Text="제목" CssClass="label_text"></asp:Label><asp:TextBox ID="title" runat="server" CssClass="title_textbox" ReadOnly="False"></asp:TextBox><br />
            <br />
            <br />
            <%--작성자 작성일 조회수 --%>
            <asp:Label runat="server" Text="작성자" CssClass="label_text"></asp:Label>
            <asp:Label ID="nickname" runat="server" Text="" CssClass="label_text"></asp:Label><br />
            <br />
            <asp:Label ID="lblDate" runat="server" Text="작성일" CssClass="label_text"></asp:Label><asp:Label ID="writeday" runat="server" Text=""></asp:Label><br />
            <br />
            <asp:Label ID="lblCount" runat="server" Text="조회수" CssClass="label_text"></asp:Label><asp:Label ID="readcount" runat="server" Text=""></asp:Label><br /><br />
            <asp:Label ID="Label3" runat="server" Text="사진 첨부" CssClass="sell_left"></asp:Label><asp:FileUpload ID="ImageUpload" runat="server" CssClass="sell_right" Height="60%" />
            <br />
            <br />
        </div>
        <div id="View_Contents">
            <div id="sell_img">
                <style type="text/css">
                    .tg {
                        border-collapse: collapse;
                        border-spacing: 0;
                    }

                        .tg .tg-baqh {
                            text-align: center;
                            vertical-align: top
                        }

                        .tg .tg-0lax {
                            text-align: left;
                            vertical-align: top;
                            width: 100%;
                        }
                </style>
                <table class="tg" border="1">
                    <thead>
                        <tr>
                            <th class="tg-baqh" colspan="4" rowspan="3">
                                <asp:Image runat="server" ID="imageout" Width="300px" Height="200px" />

                            </th>
                            <th class="tg-0lax" colspan="4">
                                <asp:Label runat="server" ID="lbl_title" Text="제목 :"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <td class="tg-0lax" colspan="4">
                                <asp:Label runat="server" ID="Label1" Text="위치 :"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tg-0lax" colspan="4">
                                <asp:Label runat="server" ID="Label2" Text="가격 :"></asp:Label>
                            </td>
                        </tr>
                    </thead>
                </table>
            </div>
            <asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="False" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox><br />
            <br />
        </div>
        <br />
        <br />
        <div id="View_Btn_loc">
            <asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn" OnClick="Update_Btn"/>
            <asp:Button ID="Button1" runat="server" Text="취소" CssClass="View_Btn" OnClick="back_board_Btn" />
            <asp:Label runat="server" ID="testlbl"></asp:Label>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

