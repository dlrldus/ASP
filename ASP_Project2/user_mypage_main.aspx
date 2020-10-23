<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="user_mypage_main.aspx.cs" Inherits="ASP_Project2_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="container">
        <asp:ImageButton ImageUrl="icon/member.png" Width="160px" Height="110px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="마이페이지" Font-Size="42pt" Font-Bold="True"></asp:Label><br />
<%--        <asp:Button runat="server" Text="회원 정보" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="내 게시물" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="거래 목록" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="고객 센터" Width="200px" Height="80px" />--%>

        <br />
        <br />
        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="마이페이지" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <br />
        <hr />

        <asp:Button runat="server" Text="회원정보 수정" Width="200px" Height="50px" onClick="Moduserinfo_Click" />
        <asp:Button runat="server" ID="note" Text="쪽지" Width="200px" Height="50px" OnClick="note_Click" />
        <br />
        <br />
        <asp:Label runat="server" Text="수강과목" Font-Size="27pt" Font-Bold="True"></asp:Label><br />
        <asp:TextBox runat="server" ReadOnly="true" Width="30%" Height="100px">
            #데이터베이스 #C #JAVA
        </asp:TextBox>

        <br />
        <br />
        <asp:Label runat="server" Text="프로필" Font-Size="27pt" Font-Bold="True"></asp:Label><br />
        <asp:Image runat="server" ImageUrl="~/ASP_Project2/Images/1.jpg" Width="200px" Height="250px" />
        <asp:TextBox runat="server" ReadOnly="true" Width="40%" Height="250px" Placeholder="자기소개를 입력해주세요."></asp:TextBox>
        <br />
        <br />

        <asp:Button runat="server" Text="프로필 사진 수정" Width="200px" Height="50px" /><br />
        <br />

        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="내 게시물" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <hr />
        <%--내게시물--%>
        <asp:GridView ID="myPost" runat="server" AutoGenerateColumns="False" DataKeyNames="num"
            AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px">
            <Columns>
                <asp:BoundField DataField="num" HeaderText="게시글번호" />
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a href="<%# "sellpost_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="writedate" HeaderText="가격" />
                <asp:BoundField DataField="price" HeaderText="작성일자" />
            </Columns>
            <EmptyDataRowStyle BorderStyle="Double" />
            <HeaderStyle BorderStyle="None" />
        </asp:GridView>
        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="거래 목록" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <asp:GridView ID="deal" runat="server" AutoGenerateColumns="False" DataKeyNames="num"
            AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" Width="100%" Height="320px">
            <Columns>
                <asp:BoundField DataField="num" HeaderText="게시글번호" />
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a href="<%# "View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="writedate" HeaderText="가격" />
                <asp:BoundField DataField="price" HeaderText="작성일자" />
            </Columns>
            <HeaderStyle BorderStyle="None" />
        </asp:GridView>
        <hr />
        <%--내 거래목록--%>
        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="고객센터" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <br />
        <br />

        <hr />
        <asp:Button runat="server" Text="문의하기" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="신고하기" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="FNQ" Width="200px" Height="80px" OnClick="Service_center_Click" />
        <asp:Button runat="server" Text="회원탈퇴" Width="200px" Height="80px" onClick="Secession_Btn" OnClientClick="return confirm('회원탈퇴시 기존 회원정보는 복구불가합니다. \n\n그래도 회원탈퇴 하시겠습니까?'); "/>
    </div>
</asp:Content>
