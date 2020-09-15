<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="View_Container">
        <div id="top_Btn">
            <%--상단 수정,삭제 버튼--%>
            <asp:Button ID="Button3" runat="server" Text="삭제" CssClass="View_BtnT" />
            <asp:Button ID="Button2" runat="server" Text="수정" CssClass="View_BtnT" /><br />
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
            <br />
            <br />
        </div>
        <div id="View_Contents">
            <asp:Image runat="server" ID="imageout" Width="300px" Height="200px" />
            <asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" Style="scrollbar-darkshadow-color: antiquewhite; font-size: 15pt;" ReadOnly="True" CssClass="View_txtBox" BorderStyle="None"></asp:TextBox><br />
            <br />
            <div id="recommend">
                <table  style="width: 100%;height:40px;">
                    <tr>
                        <td style="width: 10%; text-align: center;">
                           <%-- <asp:Label runat="server" ID="recommend_label" Width="10%" Text="댓글작성"></asp:Label>--%>댓글작성
                        </td>   
                        <td style="width: 80%;">
                            <asp:TextBox runat="server" TextMode="MultiLine" Height="80%" Width="100%"></asp:TextBox>

                        </td>
                        <td >
                            <asp:Button runat="server" Text="댓글작성" CssClass="View_Recom_Btn"/>

                        </td>
                    </tr>
                </table>
            </div>
        </div><br /><br />
        <div id="View_Btn_loc">
            <asp:Button ID="Button4" runat="server" Text="글 올리기" CssClass="View_Btn" />
            <asp:Button ID="Button1" runat="server" Text="목록보기" CssClass="View_Btn" />

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

