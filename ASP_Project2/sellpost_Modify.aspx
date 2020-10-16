<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="sellpost_Modify.aspx.cs" Inherits="ASP_Project2_Default" %>

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
                    <asp:Label runat="server" Text="작성자" CssClass="request_label_text"></asp:Label>
                </asp:TableHeaderCell>
                <asp:TableCell ColumnSpan="3">
                    <asp:Label ID="nickname" runat="server" Text="" CssClass="request_label_text"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell CssClass="column_text">
                    <asp:Label ID="lblDate" runat="server" Text="작성일" CssClass="request_label_text"></asp:Label>
                </asp:TableHeaderCell>
                <asp:TableCell>
                     <asp:Label ID="writeday" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableHeaderCell CssClass="column_text">
                    <asp:Label ID="lblCount" runat="server" Text="조회수" CssClass="request_label_text"></asp:Label>
                </asp:TableHeaderCell>
                <asp:TableCell>
                    <asp:Label ID="readcount" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell CssClass="column_text">
                    <asp:Label ID="Label3" runat="server" Text="사진 첨부" Width="100%" CssClass="request_label_text"></asp:Label>
                </asp:TableHeaderCell>
                <asp:TableCell ColumnSpan="3">
                    <asp:FileUpload ID="ImageUpload" runat="server" CssClass="request_right" Height="60%" />
                </asp:TableCell>
            </asp:TableRow>

        <%--</div>--%>
        <%--<div id="View_Contents">--%>
            <asp:TableRow>
                <asp:TableHeaderCell RowSpan="2" CssClass="column_text">
                    <asp:Label ID="Label5" runat="server" Text="내용" Width="100%" CssClass="request_label_text"></asp:Label>
                </asp:TableHeaderCell>
                <asp:TableCell ColumnSpan="4">
                    <p></p>
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
                <table class="tg" border="0" style="width:100%;">
                    <thead>
                        <tr>
                            <th colspan="5" style="font-size:16pt; background-color: #f2f2f2;"><asp:Label ID="Label4" runat="server" Text="도서정보"></asp:Label></th>
                        </tr>
                        <tr>
                            <td colspan="5" style="font-size:13pt;">
                                <asp:Label ID="category_f" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text=" > "></asp:Label>
                                <asp:Label ID="category_s" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th class="tg-baqh" colspan="4" rowspan="3">
                                <asp:Image runat="server" ID="imageout" Width="180px" Height="200px" />

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
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="False" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>          
        <%--</div>--%>
            </asp:Table>
        <hr style="border: 1px initial; width: 100%;"/>
        <br />
        <br />
        <div id="View_Btn_loc">
            <asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn_up" OnClick="Update_Btn"/>
            <asp:Button ID="Button1" runat="server" Text="취소" CssClass="View_BtnC" OnClick="back_board_Btn" />
            <asp:Label runat="server" ID="testlbl"></asp:Label>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

