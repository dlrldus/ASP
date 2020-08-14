<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Site.master" AutoEventWireup="true" CodeFile="mypage.aspx.cs" Inherits="ASP_Project2_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="container">
        <asp:ImageButton ImageUrl="icon/member.png" Width="160px" Height="110px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="마이페이지" Font-Size="42pt" Font-Bold="True"></asp:Label><br />
        <asp:Button runat="server" Text="회원 정보" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="내 게시물" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="거래 목록" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="고객 센터" Width="200px" Height="80px" />

        <br />
        <br />
        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="마이페이지" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <br />
        <hr />

        <asp:Button runat="server" Text="회원정보 수정" Width="200px" Height="50px" />
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

        <asp:Button runat="server" Text="프로필 사진 수정" Width="200px" Height="50px" /><br /><br />

        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="내 게시물" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <hr />
        <pre>
        그
        리
        드
        뷰
        </pre>
        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="거래 목록" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <hr />
        <pre>
        그
        리
        드
        뷰
        </pre>
        <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="고객센터" Font-Size="32pt" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <hr />
        <asp:Button runat="server" Text="문의하기" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="신고하기" Width="200px" Height="80px" /><br />
        <asp:Button runat="server" Text="FNQ" Width="200px" Height="80px" />
        <asp:Button runat="server" Text="회원탈퇴" Width="200px" Height="80px" />
    </div>
</asp:Content>
