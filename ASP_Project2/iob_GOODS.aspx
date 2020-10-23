<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="iob_GOODS.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Simple Multi-Item Slider: Category slider with CSS animations" />
    <meta name="keywords" content="jquery plugin, item slider, categories, apple slider, css animation" />
    <meta name="author" content="Codrops" />

    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/modernizr.custom.63321.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <div class="container" runat="server">

        <!--/ Codrops top bar -->
        <div class="main">
            ,

            <div id="mi-slider" class="mi-slider">
                <ul>
                    <li><a href="#">
                        <img src="images/goods/pen_goods1.jpg" alt="img01"><h4>오피스디포 <br /> 0.5mm</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/pen_goods2.jpg" alt="img02"><h4>파이롯트 <br /> 0.38mm</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/pen_goods3.jpg" alt="img03"><h4>젤잉크펜 <br /> 12자루</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/pen_goods4.jpg" alt="img04"><h4>3색터치펜 <br /> 3색볼펜</h4>
                    </a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="images/goods/note_goods1.jpg" alt="img05"><h4>우드밀리 <br /> 스프링노트</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/note_goods2.jpg" alt="img06"><h4>미니패드 <br /> 절취선노트 <%--&amp; Caps--%></h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/note_goods3.jpg" alt="img07"><h4>마뜨 40절 <br /> 다이어리</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/note_goods4.jpg" alt="img08"><h4>아이비스 <br /> 오답노트</h4>
                    </a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="images/goods/bookmark_goods1.jpg" alt="img09"><h4>일러스트 <br /> 책갈피</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/bookmark_goods2.jpg" alt="img10"><h4>가을다람쥐 <br /> 책갈피</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/bookmark_goods3.jpg" alt="img11"><h4>워너디스 <br /> 클래식</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/bookmark_goods4.jpg" alt="img11"><h4>카라빈카 <br /> 클래식</h4>
                    </a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="images/goods/postcard_goods1.jpg" alt="img12"><h4>메시지하트 <br /> 엽서</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/postcard_goods2.jpg" alt="img13"><h4>스마일 칭찬 <br /> 미니카드</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/postcard_goods3.jpg" alt="img14"><h4>크라프트 <br /> 무지엽서</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/goods/postcard_goods4.jpg" alt="img15"><h4>벚꽃카드 <br /> 디자인카드</h4>
                    </a></li>
                </ul>
                <nav>
                    <a href="#">볼펜</a>
                    <a href="#">노트</a>
                    <a href="#">책갈피</a>
                    <a href="#">엽서</a>
                </nav>
            </div>
        </div>
    </div>
    <!-- /container -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/jquery.catslider.js"></script>
    <script>

        $(function () {
            $('#mi-slider').catslider();
        });
    </script>
    <script src="//tympanus.net/codrops/adpacks/demoad.js"></script>

    <div id="goods_left">
        <div id="test">
            <div id="test_top">
                <img src="Images/cate.png" style="width: 100%; height: 80px;" />
            </div>
            <div id="test_left">
                <ul>
                    <li><span>첫아기책</span></li>
                    <li><span>국내창작</span></li>
                    <li><span>세계창작</span></li>
                    <li><span>초등문학</span></li>
                    <li><span>전래동화</span></li>
                    <li><span>동화동화</span></li>
                    <li><span>화동화동</span></li>
                    <li><span>뭐라쓰지</span></li>
                    <li><span>카테고리</span></li>
                    <%--                </ul>
            </div>
            <div id="test_right">
                <ul>--%>
                    <li><span>명작동화</span></li>
                    <li><span>수학동화</span></li>
                    <li><span>과학동화</span></li>
                    <li><span>자연관찰</span></li>
                    <li><span>역사/유사</span></li>
                    <li><span>경제/사회</span></li>
                    <li><span>사이언스</span></li>
                    <li><span>중허언책</span></li>
                    <li><span>책헌책헌</span></li>
                </ul>
            </div>

        </div>
    </div>
    <div id="goods_right">
        <asp:DataList ID="RecentBook" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="30" CellSpacing="10" HorizontalAlign="Center" GridLines="both" Width="100%" ItemStyle-Width="300px" ItemStyle-VerticalAlign="Middle" BorderStyle="None">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <a href="<%# "View.aspx?No=" + Eval("num")%>">
                                <asp:Image ID="recentImg" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Width="90%" Height="200px" ImageAlign="Middle" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="이름 : "></asp:Label>
                            <%# Eval("name") %><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="가격 : "></asp:Label><%# Eval("price") %> 원
                        </td>
                    </tr>
                    <br />
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

