<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="request_Modify.aspx.cs" Inherits="ASP_Project2_Default" %>

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
                         <asp:Label runat="server" Text="작성자" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell ColumnSpan="3">
                        <asp:Label ID="nickname" runat="server" Text="" CssClass="request_label_text"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                        <asp:Label ID="lblDate" runat="server" Text="작성일" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell>
                        <asp:Label ID="writeday" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableHeaderCell CssClass="column_text">
                        <asp:Label ID="lblCount" runat="server" Text="조회수" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell>
                        <asp:Label ID="readcount" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                        <%--<asp:Label ID="Label3" runat="server" Text="사진 첨부" CssClass="sell_left"></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text="사진 첨부" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell ColumnSpan="3">
                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="request_right" Height="60%" />
                    </asp:TableCell>
                </asp:TableRow>  
        <%--<br />
            <br />
        </div>--%>
        <%--<div id="View_Contents">--%>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="column_text">
                        <asp:Label ID="Label1" runat="server" Text="내용" Width="100%" CssClass="request_label_text"></asp:Label>
                    </asp:TableHeaderCell>
                    <asp:TableCell ColumnSpan="3"> 
                        <div id="modify_content">
                        <asp:Image runat="server" ID="imageout" Width="300px" Height="200px" />
                        <asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="False" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            
            
        <%-- <br />
        </div>--%>
        </asp:Table>
        <hr style="border: 1px double #cccaca; width: 100%;"/>
         <div id="View_Btn_loc">
            <asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn_up" OnClick="Update_Btn"/>
            <asp:Button ID="Button1" runat="server" Text="취소" CssClass="View_BtnC" OnClick="back_board_Btn" />
        </div>  
        <%-------------------------댓글창------------------------%>
        <div id="recommend" style="margin-top: 20px">
        <%--<asp:Label runat="server" Font-Bold="true" Font-Size="16pt">■댓글쓰기</asp:Label>--%>
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
            <%--<div id="recommend">
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
                </table>--%>
                <asp:GridView ID="reply_grid" runat="server" AutoGenerateColumns="False"  EnableModelValidation="True"
                    AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="100%">
                    <Columns>

                        <%-- 주석줄1 <asp:BoundField DataField="postnumber" HeaderText="postnumber" SortExpression="postnumber" />--%>
                        <asp:BoundField DataField="nickname" SortExpression="nickname" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="comment" SortExpression="comment" ItemStyle-Width="80%" />
                        <asp:BoundField DataField="writedate" SortExpression="writedate" />
                    </Columns>
                </asp:GridView>
                <%-- 주석줄2 <asp:SqlDataSource ID="relpy_comment" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString5 %>"
                    SelectCommand="SELECT [nickname], [comment], [writedate], [postnumber] FROM [reply] ORDER BY [writedate] DESC"></asp:SqlDataSource> --%>
                <%-- 주석줄3 where [postnumber]=@postnumber--%>
                <asp:HiddenField runat="server" ID="idcheck" />
                <asp:HiddenField runat="server" ID="number_che" />
                <asp:HiddenField runat="server" ID="postnum_che" />
            </div>
        </div>
        <br />
        <br />
<%--        <div id="View_Btn_loc">
            <asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn" OnClick="Update_Btn"/>
            <asp:Button ID="Button1" runat="server" Text="취소" CssClass="View_Btn" OnClick="back_board_Btn" />
        </div>--%>
    <%--</div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

<%--댓글기능 미구현

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
                <asp:GridView ID="reply_grid" runat="server" AutoGenerateColumns="False" DataSourceID="relpy_comment" EnableModelValidation="True"
                    AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="100%">
                    <Columns>
                      <asp:BoundField DataField="postnumber" HeaderText="postnumber" SortExpression="postnumber" />
                        <asp:BoundField DataField="nickname"  SortExpression="nickname" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="comment" SortExpression="comment" ItemStyle-Width="80%" />
                        <asp:BoundField DataField="writedate"  SortExpression="writedate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="relpy_comment" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString5 %>" 
                    SelectCommand="SELECT [nickname], [comment], [writedate], [postnumber] FROM [reply] ORDER BY [writedate] DESC"></asp:SqlDataSource>
                where [postnumber]=@postnumber
                <asp:HiddenField runat="server" ID="number_che" />
                <asp:HiddenField runat="server" ID="postnum_che" />
            </div>--%>