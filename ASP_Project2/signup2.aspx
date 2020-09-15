<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup2.aspx.cs" Inherits="signup2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="signup_body">
    <form id="form1" runat="server">        
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
                <asp:Image ID="join_process" runat="server" ImageUrl="~/Images/Gstep2.png" Width="950px" Height="150px"/>

                <h3 class="signup-top">기본 정보 입력</h3>
                <hr />
                <br />

                <fieldset class="signup_fieldset py-4">
                  <div class="row">
                      <div class="col-1"></div>
                    <div class="col-9">
                    <asp:Label runat="server" Text="아이디" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="id" runat="server" CssClass="form_right" Width="300px" Placeholder="ID는 15자이내" MaxLength="15"></asp:TextBox>
                    <asp:Button runat="server" ID="IDCheck" Text="중복체크" onClick="IDCheck_Click" CssClass="IDCheck_btn"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ID" ErrorMessage="아이디를 입력하세요." ControlToValidate="id" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="비밀번호" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="pwd" runat="server" CssClass="form_right" TextMode="Password" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="other" ErrorMessage="패스워드를 입력하세요." ControlToValidate="pwd" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="비밀번호 확인" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="pwdcheck" runat="server" CssClass="form_right" TextMode="Password" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="other" ErrorMessage="패스워드확인을 입력하세요." ControlToValidate="pwdcheck" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="other" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToValidate="pwdcheck" ControlToCompare="pwd" Display="Dynamic" CssClass="required"></asp:CompareValidator>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="닉네임" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="nickname" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                    <asp:Button runat="server" ID="NickCheck" Text="중복체크" onClick="NickCheck_Click" CssClass="IDCheck_btn2"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="nickname" ErrorMessage="닉네임을 입력하세요." ControlToValidate="nickname" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="이름" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="name" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="other" ErrorMessage="이름을 입력하세요." ControlToValidate="name" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="생년월일" CssClass="form_left"></asp:Label>
                    <%--생년월일 히든필드--%>
                    <asp:HiddenField runat="server" ID="birth" /><asp:HiddenField runat="server" ID="birthyear" /><asp:HiddenField runat="server" ID="birthmonth" /><asp:HiddenField runat="server" ID="birthday" />
                    <%--생년월일 DropDownList--%>
                    <asp:DropDownList ID="lstYear" runat="server" OnSelectedIndexChanged="lstYear_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>년
                    <asp:DropDownList ID="lstMonth" runat="server" OnSelectedIndexChanged="lstMonth_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>월
                    <asp:DropDownList ID="lstDay" runat="server"></asp:DropDownList>일

                    <p><hr /></p>

                    <asp:Label runat="server" Text="핸드폰 번호" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="phonesum" runat="server" Visible="false" AutoPostBack="True"></asp:TextBox>
                    <asp:TextBox ID="phone1" runat="server" CssClass="form_right" Width="60px" MaxLength="3"></asp:TextBox>
                    -
                     <asp:TextBox ID="phone2" runat="server" CssClass="form_right" Width="100px" MaxLength="4"></asp:TextBox>
                    -
                     <asp:TextBox ID="phone3" runat="server" CssClass="form_right" Width="100px" MaxLength="4"></asp:TextBox>
                    <%--전화번호 DropDownList--%>
                    <asp:DropDownList runat="server" ID="phone" OnSelectedIndexChanged="phoneList_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>SKT</asp:ListItem>
                        <asp:ListItem>KT</asp:ListItem>
                        <asp:ListItem>LG U+</asp:ListItem>
                    </asp:DropDownList>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="주소" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="address" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="other" ErrorMessage="주소를 입력하세요." ControlToValidate="address" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <br />
                    <p><hr /></p>

                    <asp:Label runat="server" Text="이메일" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="email" runat="server" CssClass="form_right" Width="130px"></asp:TextBox>
                    @
                    <asp:TextBox ID="domainText" runat="server" CssClass="form_right" Width="170px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="other" ErrorMessage="이메일을 입력하세요." ControlToValidate="email" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>
                    <%--이메일 DropDownList--%>
                    <asp:DropDownList runat="server" ID="EmailList" OnSelectedIndexChanged="EmailList_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>- 직접입력 -</asp:ListItem>
                        <asp:ListItem>naver.com</asp:ListItem>
                        <asp:ListItem>daum.net</asp:ListItem>
                        <asp:ListItem>google.co.kr</asp:ListItem>
                    </asp:DropDownList>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="학교" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="school" runat="server" CssClass="form_right" Width="130px" ReadOnly="true"></asp:TextBox>
                    <asp:DropDownList runat="server">
                        <asp:ListItem>
                        </asp:ListItem>
                    </asp:DropDownList>

                    <p><hr /></p>

                    <asp:Label runat="server" Text="학과" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="major" runat="server" CssClass="form_right" Width="130px" ReadOnly="true"></asp:TextBox>
                    <asp:DropDownList runat="server">
                        <asp:ListItem>
                        </asp:ListItem>
                    </asp:DropDownList>

                    <p><hr /></p>
                    <br />
                    <br />
                    
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                           <asp:Button ID="Button1" runat="server" Text="취소" Height="60px" Width="190px" CssClass="signup_data_btn1" OnClick="Btn_Click"/>
                           <asp:Button runat="server" ID="Signup_Btn" Text="가입하기" Height="60px" Width="190px" OnClick="Signup_Btn_click" CssClass="signup_data_btn2" />
                        </div>
                        <div class="col-2"></div>
                    </div>

                    </div>

                    <div class="col-2"></div>
                    </div>
                </fieldset>
            </section>
            <div class="col-3"></div>
            </div>
    </form>
</body>
</html>
