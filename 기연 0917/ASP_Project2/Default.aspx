<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">


   <%-- <asp:Label runat="server" ID="MysqlTest" Text="Mysql_Test_label"></asp:Label><br />--%>
<%--    <asp:Label runat="server" ID="change" Text="Mysql_Test_label"></asp:Label><br />--%>
    <%--<asp:Button runat="server" Text="테스트버튼" ID="Btntest" OnClick="Btntest_Click" />
    <asp:Repeater ID="Repeater1" runat="server">--%>

        <%--<ItemTemplate>
            <!-- 영역내 표현하고자하는것 - 리피터-->
            번호   <%# Eval("num") %><br />
            <!--  데이터 바인딩 식과, Row값을 반환 받는 구문 UserID를 받아오는 부분  -->
            닉네임   <%# Eval("nickname") %><br />
            <!-- Password를 받아오는 부분  -->
            내용    <%# Eval("comment") %><br />
            <!-- Name을 받아오는 부분   -->
            작성일   <%# Eval("writedate") %><hr />
            <!-- Phone을 받아오는 부분   -->
            포스트넘버<%# Eval("postnumber") %><hr />
            <!-- Phone을 받아오는 부분   -->
        </ItemTemplate>
    </asp:Repeater>--%>
    <br /><br /><br />

   <%-- <i class="fa fa-angle-left"></i>
    <i class="fa fa-angle-right"></i>--%>

    <%--<i class="xi-angle-left-thin"></i>
    <i class="xi-angle-right-thin"></i>--%>
    

    <%--<section class="visual">
        <div><img src="Images/cat1.jpg" alt="" /></div>
        <div><img src="Images/cat2.jpg" alt="" /></div>
        <div><img src="Images/cat3.jpg" alt="" /></div>
    </section>--%>

    <%-- <script type="text/javascript">
         $('.visual').slick();
     </script>--%>

    <%--<script type="text/javascript">
            $('.visual').slick({
                autoplay: true,
                autoplayspeed: 2000
                
            });
    </script>--%>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

