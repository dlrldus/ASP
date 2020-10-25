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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/goods.css" />
    <script src="js/modernizr.custom.63321.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>   

    <div class="container" runat="server">
    
        <asp:ImageButton ImageUrl="icon/shopping-cart.png" Width="90px" Height="70px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="중헌책굿즈" Font-Size="26pt" Font-Bold="True"></asp:Label>
        <!--/ Codrops top bar -->
        <div class="main">               
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
    
    <!-- /container -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/jquery.catslider.js"></script>
    <script>

        $(function () {
            $('#mi-slider').catslider();
        });
    </script>

    <script src="//tympanus.net/codrops/adpacks/demoad.js"></script>
        <div class="container">
        <div class="row">
            <asp:Image ID="Image1" runat="server"  />
        </div>
        <div class="row py-5">
        <div class="tab_wrap col-15">
            <div class="tab_menu_container">               
                 <button class="tab_menu_btn1 tab_menu_btn on ml-3" type="button">볼펜</button>
                 <button class="tab_menu_btn2 tab_menu_btn" type="button">노트</button>
                 <button class="tab_menu_btn3 tab_menu_btn" type="button">책갈피</button>
                 <button class="tab_menu_btn4 tab_menu_btn" type="button">엽서 우표</button>
                 <button class="tab_menu_btn5 tab_menu_btn" type="button">머그컵</button>                
             </div> <!-- tab_menu_container e -->

             <div class="tab_box_container">

             <%-----볼펜 메뉴-----%>
             <div class="tab_box1 tab_box on">
                 <ul class="product_list py-4">
                    <li>
	                    <dl>
                        <dt><a href="#a">오피스디포 상품명자바 E-오피스 흑색 0.5mm</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/pen_goods1.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">2,500원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">파이롯트 프릭션 지워지는 볼펜 리필심 0.38mm</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/pen_goods2.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">1,500원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">젤잉크펜12자루 유성펜 볼펜 멀티펜 학용품 형광펜</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/pen_goods3.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">3,000원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">3색터치펜 니들 UV 3색볼펜 초저점도 잉크 스마트폰</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/pen_goods4.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">2,500원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">유니볼 원 볼펜 UMN-S-38 0.38mm /10자루</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/pen_goods5.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">4,000원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">유니 제트스트림칼라0.7mm SXN-150C-07 /10자루</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/pen_goods6.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">2,000원</dd>
                        </dl>
                    </li>
                 </ul>
             </div>

             <%-----노트 메뉴-----%>
             <div class="tab_box2 tab_box">
             <ul class="product_list py-4">
                    <li>
	                    <dl>
                        <dt><a href="#a">우드밀리 스프링노트 두꺼운노트 대학노트 공책 연습장</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/note_goods1.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">2,000원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">6000 인덱스노트 11522<br /><br /></a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/note_goods2.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">3,000원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">마뜨 40절 메모 다이어리속지(10.8x17/Memo169)N9416</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/note_goods3.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">3,000원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">아이비스 2000 오답풀이노트(SP) 문구 노트 무제노트</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/note_goods4.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">2,500원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">양지 신학기 일반노트(32매) /188X260(16절)10권</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/note_goods5.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">9,500원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">펜피아 600 초등 1-2무제노트(16매) 10권-공용</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/note_goods6.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">11,500원</dd>
                        </dl>
                    </li>
                 </ul>
             </div>

             <%-----책갈피 메뉴-----%>
             <div class="tab_box3 tab_box">
                 <ul class="product_list py-4">
                    <li>
	                    <dl>
                        <dt><a href="#a">귀여운 고양이 일러스트 자석 북마크 5개 보드 판</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/bookmark_goods1.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">1,930원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">가을 다람쥐 책갈피 북클립 북마크 핸드메이드</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/bookmark_goods2.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">5,900원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">워너디스 상품명 워너디스 클래식 레더 태슬링 북마크</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/bookmark_goods3.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">15,500원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">카라빈카 안경매듭책갈피-(2종세트)나비 금관장식</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/bookmark_goods4.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">13,400원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">리틀 위치 책갈피 북클립 북마커 북마크 책표시</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/bookmark_goods5.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">9,300원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">언더 블루 펄 책갈피 북마크 북마커 북클립 책표시</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/bookmark_goods6.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">8,500원</dd>
                        </dl>
                    </li>
                 </ul>
             </div>

             <%-----엽서, 우표 메뉴-----%>
             <div class="tab_box4 tab_box">
                 <ul class="product_list py-4">
                    <li>
	                    <dl>
                        <dt><a href="#a">메시지 하트 엽서/감사/답례/행사/업체/어버이날 학교</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/postcard_goods1.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">250원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">스마일 칭찬 미니카드 /미니엽서/학교/행사/기업</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/postcard_goods2.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">200원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">크라프트 무지엽서20매/DIY 카드/손글씨엽서/그래피</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/postcard_goods3.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">4,000원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">벚꽃카드 YD-22 문구카드 카드 디자인카드 다용도카드</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/postcard_goods4.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">500원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">이순신 장군 우표 1975년 충무공 보통우표(276)</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/postcard_goods5.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">1,200원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">세종대왕 우표 1966년 제2차 국산백지 보통우표(242)</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/postcard_goods6.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">1,440원</dd>
                        </dl>
                    </li>
                 </ul>
             </div>

             <%-----머그컵-----%>
             <div class="tab_box5 tab_box">
                 <ul class="product_list py-4">
                    <li>
	                    <dl>
                        <dt><a href="#a">10도씨 상품명캐리보틀 몬스터 텀블러 900ml 대용량텀블러</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/mugcup_goods1.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">15,800원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">(주방노리) 로얄킴스 빈티지 블루 머그컵 잔 커피잔</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/mugcup_goods2.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">8,260원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">포스아트 상품명무지 머그컵 모음/손잡이컵 유리 머그컵 컵</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/mugcup_goods3.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">940원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">추카추카넷 상품명숲속의 나라 머그컵 2p 셋트</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/mugcup_goods4.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">17,160원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">골드링 하트 머그컵 350ml /홈카페 도자기머그잔</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/mugcup_goods5.jpg" alt="" class="goods_img" /></a></dd>
                        <dd class="price">12,380원</dd>
                        </dl>
                    </li>
                    <li>
	                    <dl>
                        <dt><a href="#a">뚜껑머그 도자기잔/머그잔/머그컵/찻잔/물컵</a></dt>
                        <dd class="img"><a href="#a"><img src="images/goods/mugcup_goods6.jpg" alt="" class="goods_img"></a></dd>
                        <dd class="price">6,740원</dd>
                        </dl>
                    </li>
                 </ul>
             </div>
            </div>
        </div>
        </div>
        </div>

        <%-------------텝 매뉴 스크립트---------------%>
        <script>
        //버튼 색 제거,추가
                $('.tab_menu_btn').on('click', function () {
                    $('.tab_menu_btn').removeClass('on');
            $(this).addClass('on')
        });

        //1번 컨텐츠
        $('.tab_menu_btn1').on('click', function () {
                    $('.tab_box').hide();
            $('.tab_box1').show();
        });

        //2번 컨텐츠
        $('.tab_menu_btn2').on('click', function () {
                    $('.tab_box').hide();
            $('.tab_box2').show();
        });


        //3번 컨텐츠
        $('.tab_menu_btn3').on('click', function () {
                    $('.tab_box').hide();
            $('.tab_box3').show();
        });


        //4번 컨텐츠
        $('.tab_menu_btn4').on('click', function () {
                    $('.tab_box').hide();
            $('.tab_box4').show();
        });


        //5번 컨텐츠
        $('.tab_menu_btn5').on('click', function () {
                    $('.tab_box').hide();
            $('.tab_box5').show();
        });
    </script>

    

</div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

