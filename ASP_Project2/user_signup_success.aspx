<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_signup_success.aspx.cs" Inherits="user_signup_success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <header>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="Images/logo_header.png" OnClick="Btn_Click" Width="100%" Height="330px" runat="server" />
                </div>
                <div class="col-3"></div>
            </div>
        </header>

            <div class="row">
                <div class="col-3"></div>
                <section class="col-6">
                    <asp:Image ID="join_process" runat="server" ImageUrl="Images/Gstep3.png" Width="950px" Height="150px" />
                
                    <h3 class="signup-top">가입 완료</h3>
                    <hr /><br />

                    <div class="container">
                        <div class="signup_success py-4 h3">
                        <p style="font-weight:bold; font-size:30px;"><span>중헌책 <span style="color:red">회원가입</span>이 완료 되었습니다!</span></p>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:Panel ID="Panel1" runat="server" CssClass="signup_panel py-3">
                                    <p style="font-weight:bold; color:white; font-family:HYGothic-Extra; font-size:30px">중헌책 안내</p>

                                    <p><span style="color:yellow">중헌책은 유한대학교 졸업작품 사이트로</span>
                                        <span>중고 교재 거래 사이트입니다.</span>
                                        <br />

                                        <span>원하는 가격에 책을 올리고, 희망하는 책을 구매하며 효율적인 도서 거래를 진행해보세요</span>                                       
                                        <br />

                                        <span>회원 가입 후 로그인을 진행하면 다양한 서비스를 이용할 수 있습니다.</span>
                                    </p>

                                    <hr style="border:dotted;"/>    <br />

                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8">
                                             <asp:Panel ID="Panel2" runat="server" CssClass="signup_panel2 py-3">

                                                 <div class="row">
                                                    <div class="col-1"></div>
                                                        <div class="col-5 pl-2">
                                                            <asp:ImageButton ID="ImageButton2" runat="server" OnClick="Btn_Sell_Click" ImageUrl="~/ASP_Project2/Images/sell.png" Width="100%" />
                                                        </div>
                                                        <div class="col-5">
                                                             <asp:ImageButton ID="ImageButton3" runat="server" />
                                                        </div>
                                                     <div class="col-1"></div>
                                                 </div>
                                             </asp:Panel>
                                        </div>
                                        <div class="col-2"></div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>

                </section>
                  <div class="col-3"></div>
            </div>
        
    </form>
</body>
</html>
