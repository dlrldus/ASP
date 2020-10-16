<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="iob_GOODS.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <section class="visual">
        <div>
            <a href="sellpost_Write.aspx">
                <img src="Images/goods.png" alt="" /></a>
        </div>
        <div>
            <img src="Images/slide2.png" alt="" />
        </div>
    </section>
    <script type="text/javascript">

        $('.visual').slick({
            autoplay: true,
            autoplayspeed: 4000,
            speed: 500,
            pauseOnHover: true,
            infinite: true,
            fade: true,
            cssEase: 'linear'
        });

    </script>
<%--    <div>

        <asp:AdRotator ID="AdRotator1" runat="server"
            Width="500px"
            Height="180px"
            AdvertisementFile="~/ASP_Project2/GoodRotator.xml" />

    </div>--%>
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

