<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="sellpost_View.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField runat="server" ID="post_num" />
    <div id="req_View_Container">
        <div id="top_Btn">
            <%--상단 수정,삭제 버튼--%>
            <asp:HiddenField runat="server" ID="pay_code_che" />
            <asp:Label runat="server" ID="pay_code_cheL"></asp:Label>
            <span onclick="return confirm('정말 삭제하시겠습니까?')">
                <asp:Button ID="Delete_Btn" runat="server" Text="삭제" CssClass="View_BtnD" OnClick="Delete_Btn_Click" />
            </span>
            <asp:Button ID="Modify_Btn" runat="server" Text="수정" CssClass="View_BtnM" OnClick="Update_Btn_Click" />
            <asp:Button ID="Buy_obj" runat="server" Text="구매하기" CssClass="View_BtnS" OnClick="Buy_obj_Click" />
            <asp:Button ID="Buy_objF" runat="server" Text="거래완료" CssClass="View_BtnS" Visible="false" OnClick="Buy_objF_Click" /><br />
            <%-- OnClick="Modify_Btn_Click"--%>
            <br />
            <br />
        </div>
        <asp:Table ID="Table1" runat="server" Width="100%" Height="400px" CssClass="table">
        <%--<div id="View_header">--%>
            <%--제목--%>
            <asp:TableRow>
                <asp:TableCell CssClass="column_text"><asp:Label runat="server" Text="제목" CssClass="request_label_text"></asp:Label></asp:TableCell>
                <asp:TableCell ColumnSpan="3"><asp:TextBox ID="title" runat="server" CssClass="request_title_textbox" ReadOnly="true"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <%--작성자 작성일 조회수 --%>
            <asp:TableRow>
                <asp:TableCell CssClass="column_text">
                    <asp:Label runat="server" Text="작성자" CssClass="request_label_text"></asp:Label>
                    <asp:HiddenField runat="server" ID="sel_email" />
                </asp:TableCell>
                <asp:TableCell ColumnSpan="3"><asp:Label ID="nickname" runat="server" Text="" CssClass="content_text"></asp:Label></asp:TableCell>
            </asp:TableRow>
                
            <asp:TableRow>
                <asp:TableCell CssClass="column_text"><asp:Label ID="lblDate" runat="server" Text="작성일" CssClass="request_label_text"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:Label ID="writeday" runat="server" Text="" CssClass="content_text"></asp:Label></asp:TableCell>

                <asp:TableCell CssClass="column_text"><asp:Label ID="lblCount" runat="server" Text="조회수" CssClass="request_label_text"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="readcount" runat="server" Text="" CssClass="content_text"></asp:Label>
                    <asp:HiddenField runat="server" ID="post_val" />
                </asp:TableCell>
            </asp:TableRow>

        <%--</div>--%>
        <%--<div id="View_Contents">--%>
            <asp:TableRow>
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
                            <th colspan="5" style="font-size:16pt; background-color: #f2f2f2;"><asp:Label ID="Label3" runat="server" Text="도서정보"></asp:Label></th>
                        </tr>
                        <tr>
                            <td colspan="5" style="font-size:13pt;">
                                <asp:Label ID="category_f" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text=" > "></asp:Label>
                                <asp:Label ID="category_s" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th class="tg-baqh" colspan="4" rowspan="3">
                                <asp:Image runat="server" ID="imageout" Width="180px" Height="200px" />

                            </th>
                            <th class="tg-0lax" colspan="4" >
                                <asp:Label runat="server" ID="lbl_title" Text="제목 :"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <td class="tg-0lax" colspan="4" >
                                <asp:Label runat="server" ID="Label1" Text="위치 :"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tg-0lax" colspan="4" >
                                <asp:Label runat="server" ID="Label2" Text="가격 :"></asp:Label>
                            </td>
                        </tr>
                    </thead>
                </table>            
            </div>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell ColumnSpan="4"><p></p><asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="True" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox></asp:TableCell>
            </asp:TableRow>            
            </asp:Table>
            <div id="View_Btn_loc">
                   <%--<asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn" />--%>
                <asp:Button ID="Button1" runat="server" Text="목록보기" CssClass="View_BtnL" OnClick="back_board_Btn" />
                <asp:Label runat="server" ID="testlbl"></asp:Label>
            </div>
            <hr style="border: 2px initial; width: 100%;"/>
            <%-------------------------댓글창------------------------%>
            <div id="recommend" style="margin-top: 20px">
                <asp:Label ID="Label4" runat="server" Text="■댓글쓰기" Font-Bold="true" Font-Size="16pt"></asp:Label>
                <table style="width: 100%; background-color: #f2f2f2; margin-top: 20px">
                     <tr>
                        <td colspan="3"><p></p></td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: center;">
                            <asp:Label runat="server" ID="recommend_label" Width="50%" Text="댓글작성" Font-Size="15pt"></asp:Label>
                        </td>
                        <td style="width: 70%;">
                            <asp:TextBox ID="reply" runat="server" TextMode="MultiLine" Height="70%" Width="95%" Font-Size="15pt"></asp:TextBox>
                        </td>
                        <td style="width: 7%;">
                            <asp:Button runat="server" Text="댓글작성" Width="100%" CssClass="View_Recom_Btn" OnClick="View_Recom_Btn" />
                        </td>
                        <td style="width: 3%;"></td>
                    </tr>
                     <tr>
                        <td colspan="3"><p></p></td>
                    </tr>
                </table>
                <asp:GridView ID="reply_grid" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
                    AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="100%" PageSize="30">
                    <Columns>
                        <%--<asp:BoundField DataField="postnumber" HeaderText="postnumber" SortExpression="postnumber" />--%>
                        <asp:BoundField DataField="nickname" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="comment" ItemStyle-Width="80%" />
                        <asp:BoundField DataField="writedate" />
                    </Columns>
                </asp:GridView>
                <%--where [postnumber]=@postnumber--%>
                <asp:HiddenField runat="server" ID="idcheck" />
                <asp:HiddenField runat="server" ID="number_che" />
                <asp:HiddenField runat="server" ID="postnum_che" />
            </div>
        <%--</div>--%>
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

