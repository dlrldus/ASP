<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="serviceCenter.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <script>        //카드를 클릭할 때마다 +,- 변경되는 함수 
        $(document).ready(function () {
            $("#accordion .card .card-link").click(function () {

                if ($(this).find("i.fa").hasClass("fa-minus")) {
                    $(this).find("i.fa").removeClass("fa-minus");
                    $(this).find("i.fa").addClass("fa-plus");
                }
                else if ($(this).find("i.fa").hasClass("fa-plus")) {
                    $(this).find("i.fa").removeClass("fa-plus");
                    $(this).find("i.fa").addClass("fa-minus");
                }
            });
        });
    </script>

    <div class="container">
        <table border ="1" style="width:100%;height:100px;font-size:22pt;text-align:center;">
            <tr>
                <td style="width:50%;">
                    그 밖의 질문이 있나요?<br />
                    <asp:Button runat="server" id="btnQnA" text="1대 1 문의" BorderStyle="Dotted" BorderWidth="4px" OnClick="btnQnA_Click" />
                    <asp:ImageButton runat="server" ImageUrl="~/ASP_Project2/icon/question.png" ImageAlign="Middle" Width="50%" Height="170px" OnClick="btnQnA_Click" />
                </td>
                <td>
                    문제가 있는 사용자가 있나요?<br />
                    <asp:Button runat="server" text="신고 글 작성" BorderStyle="Dotted" BorderWidth="4px" />
                    <asp:ImageButton runat="server" ImageUrl="~/ASP_Project2/icon/anger.png" ImageAlign="Middle" Width="50%" Height="170px" />
                </td>
            </tr>
        </table>
        <br />

        <h2><i class="fa fa-comment-dots fnq_h2">자주 묻는 질문</i></h2>
        <p></p>
        <h3>고객님께서 자주 문의하시는 질문과 답변을 모았습니다.</h3>
        <br />
        <br />

        <div id="accordion">

            <i class="fa fa-sign-in-alt">회원가입</i>
            <hr />

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseOne">
                        <div id="card_link">
                            꼭 회원가입을 해야 하나요?
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseOne" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            판매글 목록은 비회원도 볼 수 있지만, 사이트 이용을 위해서는 꼭 회원가입을 하셔야합니다.                    
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseTwo">
                        <div id="card_link">
                            회원가입후 바로 판매가 가능한가요?
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseTwo" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            가입 후 [판매하기]]로 판매 글을 올리면 판매 가능합니다.                 
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseThree">
                        <div id="card_link">
                            회원 탈퇴하려면 어떻게 하나요?
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseThree" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            마이페이지 -> 회원 탈퇴에서 신청하시면 됩니다.
                    <br />
                            다만 진행 중인 거래가 있으면 거래 후 탈퇴 신청을 해주시면 됩니다.            
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <br />
            <i class="fa fa-shopping-cart">구매자</i>
            <hr />

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseFour">
                        <div id="card_link">
                            찾는 책이 없어요 
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseFour" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        찾고자 하는 책이 없는 경우, 요청게시판을 통해 원하는 책을 요청할 수 있습니다.
                    <br />
                        그 후 알림을 통해 답변을 확인하시면 됩니다.                  
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseFive">
                        <div id="card_link">
                            이용절차를 알고 싶어요
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseFive" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            회원 가입 후 판매자는 '판매하기' 기능을 통해 책을 판매하는 글을 작성합니다.
                    <br />
                            그 후 구매자가 답변을 달면, 판매자의 계정에 알람이 갑니다. 그 후 연락을 통해 거래를 진행 하면 됩니다.
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseSix">
                        <div id="card_link">
                            아이디, 비밀번호를 잊어버렸습니다.
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseSix" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            ☎010-3190-5928 로 연락을 해주시면 빠른 시일내에 조치하도록 하겠습니다.
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseSeven">
                        <div id="card_link">
                            도서등록 후 내용을 수정하려면 어떻게 하나요?
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseSeven" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            [구매하기] 또는 [마이페이지]에서 해당 게시글을 수정할 수 있습니다.
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseEight">
                        <div id="card_link">
                            판매자 정보를 알고 싶어요.
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseEight" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            판매자의 도서를 클릭하시면 판매자의 기본정보를 확인할 수 있습니다.
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <br />
            <i class="fa fa-share">판매자</i>
            <hr />

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseNine">
                        <div id="card_link">
                            판매글을 올릴 때 어느정도 손상까지 판매 가능한가요?
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseNine" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            젖은 흔적이 있는 책, 2cm이상 찢어진 도서, 심한 낙서가 있는 책
                    <br />
                            5쪽 초과 메모, 제본 탈착, 구성품 누락인 책은 판매글에 올리시면 안됩니다.
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseTen">
                        <div id="card_link">
                            상품 배송비는 판매자 부담입니까?
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseTen" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            기본적으론 판매자께서 부담하셔야 합니다.
                    <br />
                            하지만 서로 대화를 진행해 착불로 진행하여도 무관합니다.
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseeleven">
                        <div id="card_link">
                            반품 결정된 도서의 택배비는 누가 부담하나요?
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapseeleven" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            도서의 하자로 인한 반품은 판매자 부담이 원칙이고, 구매자의 단순한 변심은 구매자의 왕복택배비 부담을 원칙으로 합니다.
                        </div>
                    </div>
                </div>
            </div>

            <div class="card my-3">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapsetwelve">
                        <div id="card_link">
                            판매 취소를 하고 싶어요
                        <i class="fa fa-plus"></i>
                        </div>
                    </a>
                </div>
                <div id="collapsetwelve" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                        <div id="card_link">
                            [마이페이지]에서 판매 취소할 글을 선택하고 취소하시면 됩니다.
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

