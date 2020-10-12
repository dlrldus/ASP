<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField runat="server" ID="post_num" />
    <div id="View_Container">
        <div id="top_Btn">
            <%--상단 수정,삭제 버튼--%>
            <asp:HiddenField runat="server" ID="pay_code_che" />
            <asp:Label runat="server" ID="pay_code_cheL"></asp:Label>
            <asp:Button ID="Delete_Btn" runat="server" Text="삭제" CssClass="View_BtnT" OnClick="Delete_Btn_Click" />
            <asp:Button ID="Modify_Btn" runat="server" Text="수정" CssClass="View_BtnT" OnClick="Update_Btn_Click"/>
            <asp:Button ID="Buy_obj" runat="server" Text="구매하기" CssClass="View_BtnT" onClick="Buy_obj_Click"/>
            <asp:Button ID="Buy_objF" runat="server" Text="거래완료" CssClass="View_BtnT" visible="false" onClick="Buy_objF_Click"/><br />
            <%-- OnClick="Modify_Btn_Click"--%>
            <br />
            <br />
        </div>
        <div id="View_header">
            <%--제목--%>
            <asp:Label runat="server" Text="제목" CssClass="label_text"></asp:Label><asp:TextBox ID="title" runat="server" CssClass="title_textbox" ReadOnly="true"></asp:TextBox><br />
            <br />
            <br />
            <%--작성자 작성일 조회수 --%>
            <asp:Label runat="server" Text="작성자" CssClass="label_text"></asp:Label>
            <asp:Label ID="nickname" runat="server" Text="" CssClass="label_text"></asp:Label><br />
            <br />
            <asp:Label ID="lblDate" runat="server" Text="작성일" CssClass="label_text"></asp:Label><asp:Label ID="writeday" runat="server" Text=""></asp:Label><br />
            <br />
            <asp:Label ID="lblCount" runat="server" Text="조회수" CssClass="label_text"></asp:Label><asp:Label ID="readcount" runat="server" Text=""></asp:Label><br />
            <asp:HiddenField runat="server" ID="post_val" />
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
            <asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="True" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox><br />
            <br />
            <%-------------------------댓글창------------------------%>
            <div id="recommend">
                <table style="width: 100%; height: 40px; background-color: gray;">
                    <tr>
                        <td style="width: 10%; text-align: center;">
                            <asp:Label runat="server" ID="recommend_label" Width="10%" Text="댓글작성"></asp:Label>
                        </td>
                        <td style="width: 80%;">
                            <asp:TextBox ID="reply" runat="server" TextMode="MultiLine" Height="80%" Width="100%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button runat="server" Text="댓글작성" CssClass="View_Recom_Btn" OnClick="View_Recom_Btn" />

                        </td>
                    </tr>
                </table>
                <asp:GridView ID="reply_grid" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
                    AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="100%">
                    <Columns>
                        <%--<asp:BoundField DataField="postnumber" HeaderText="postnumber" SortExpression="postnumber" />--%>
                        <asp:BoundField DataField="nickname" SortExpression="nickname" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="comment" SortExpression="comment" ItemStyle-Width="80%" />
                        <asp:BoundField DataField="writedate" SortExpression="writedate" />
                    </Columns>
                </asp:GridView>
                <%--where [postnumber]=@postnumber--%>
                <asp:HiddenField runat="server" ID="idcheck" />
                <asp:HiddenField runat="server" ID="number_che" />
                <asp:HiddenField runat="server" ID="postnum_che" />
            </div>
        </div>
        <br />
        <br />
        <div id="View_Btn_loc">
            <%--<asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn" />--%>
            <asp:Button ID="Button1" runat="server" Text="목록보기" CssClass="View_Btn" OnClick="back_board_Btn" />
            <asp:Label runat="server" ID="testlbl"></asp:Label>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

