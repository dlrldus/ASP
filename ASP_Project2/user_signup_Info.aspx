<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_signup_Info.aspx.cs" Inherits="signup2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="signup_body">
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
                <asp:Image ID="join_process" runat="server" ImageUrl="Images/Gstep2.png" Width="100%" Height="150px" />

                <h3 class="signup-top">기본 정보 입력</h3>
                <asp:Label runat="server" ID="testlab" Text=""></asp:Label>
                <hr />
                <br />

                <fieldset class="signup_fieldset py-4">
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-9">

                            <asp:Label runat="server" Text="" CssClass="form_left">아이디</asp:Label>
                            <asp:TextBox ID="id" runat="server" CssClass="form_right" Width="300px" MaxLength="15"></asp:TextBox>
                            <asp:Button runat="server" ID="IDCheck" Text="중복체크" OnClick="IDCheck_Click" CssClass="IDCheck_btn" />
                            <asp:HiddenField runat="server" ID="IDche_Va" Value="0" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ID" ErrorMessage="아이디를 입력하세요." ControlToValidate="id" Display="dynamic" CssClass="required"></asp:RequiredFieldValidator>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <p>
                                        <hr />
                                    </p>

                                    <asp:Label runat="server" Text="비밀번호" CssClass="form_left"></asp:Label>
                                    <asp:TextBox ID="pwd" runat="server" CssClass="form_right" TextMode="Password" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="other" ErrorMessage="패스워드를 입력하세요." ControlToValidate="pwd" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                                    <p>
                                        <hr />
                                    </p>

                                    <asp:Label runat="server" Text="비밀번호 확인" CssClass="form_left"></asp:Label>
                                    <asp:TextBox ID="pwdcheck" runat="server" CssClass="form_right" TextMode="Password" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="other" ErrorMessage="패스워드확인을 입력하세요." ControlToValidate="pwdcheck" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="other" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToValidate="pwdcheck" ControlToCompare="pwd" Display="Dynamic" CssClass="required"></asp:CompareValidator>

                                    <p>
                                        <hr />
                                    </p>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:Label runat="server" Text="닉네임" CssClass="form_left"></asp:Label>
                            <asp:TextBox ID="nickname" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                            <asp:Button runat="server" ID="NickCheck" Text="중복체크" OnClick="NickCheck_Click" CssClass="IDCheck_btn2" />
                            <asp:HiddenField runat="server" ID="Niche_Va" Value="0" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="nickname" ErrorMessage="닉네임을 입력하세요." ControlToValidate="nickname" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                            <p>
                                <hr />
                            </p>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Label runat="server" Text="이름" CssClass="form_left"></asp:Label>
                                    <asp:TextBox ID="name" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="other" ErrorMessage="이름을 입력하세요." ControlToValidate="name" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                                    <p>
                                        <hr />
                                    </p>

                                    <asp:Label runat="server" Text="생년월일" CssClass="form_left"></asp:Label>
                                    <%--생년월일 히든필드--%>
                                    <asp:HiddenField runat="server" ID="birth" />
                                    <asp:HiddenField runat="server" ID="birthyear" />
                                    <asp:HiddenField runat="server" ID="birthmonth" />
                                    <asp:HiddenField runat="server" ID="birthday" />
                                    <%--생년월일 DropDownList--%>
                                    <asp:DropDownList ID="lstYear" runat="server" OnSelectedIndexChanged="lstYear_SelectedIndexChanged" AutoPostBack="true" Font-Size="18pt"></asp:DropDownList>년
                            <asp:DropDownList ID="lstMonth" runat="server" OnSelectedIndexChanged="lstMonth_SelectedIndexChanged" AutoPostBack="true" Font-Size="18pt"></asp:DropDownList>월
                            <asp:DropDownList ID="lstDay" runat="server" Font-Size="18pt"></asp:DropDownList>일

                    <p>
                        <hr />
                    </p>

                                    <asp:Label runat="server" Text="핸드폰 번호" CssClass="form_left"></asp:Label>
                                    <asp:TextBox ID="phonesum" runat="server" Visible="false" AutoPostBack="True"></asp:TextBox>
                                    <asp:TextBox ID="phone1" runat="server" CssClass="form_right" Width="60px" MaxLength="3"></asp:TextBox>
                                    -
                     <asp:TextBox ID="phone2" runat="server" CssClass="form_right" Width="100px" MaxLength="4"></asp:TextBox>
                                    -
                     <asp:TextBox ID="phone3" runat="server" CssClass="form_right" Width="100px" MaxLength="4"></asp:TextBox>
                                    <%--전화번호 DropDownList--%>
                                    <asp:DropDownList runat="server" ID="phone" OnSelectedIndexChanged="phoneList_OnSelectedIndexChanged" AutoPostBack="True" Font-Size="16pt">
                                        <asp:ListItem>SKT</asp:ListItem>
                                        <asp:ListItem>KT</asp:ListItem>
                                        <asp:ListItem>LG U+</asp:ListItem>
                                    </asp:DropDownList>

                                    <p>
                                        <hr />
                                    </p>

                                    <asp:Label runat="server" Text="주소" CssClass="form_left"></asp:Label>
                                    <asp:TextBox ID="sample5_address" runat="server" CssClass="form_right" Width="300px"></asp:TextBox><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
                                    <asp:Label runat="server" CssClass="form_left"></asp:Label>
                                    <asp:TextBox runat="server" ID="TextBox1" Placeholder="상세주소" CssClass="form_right_t" Width="300px"></asp:TextBox>
                                    <%--                            <input type="text" id="sample5_address" placeholder="주소" style="width:400px;">   --%>

                                    <br />
                                    <br />
                                    <asp:Label runat="server" CssClass="form_left"></asp:Label><div id="map" style="width: 300px; height: 300px; display: none; border: 3px double gray;"></div>

                                    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2a1968ce4ee78a9831f6371384e8644&libraries=services"></script>
                                    <script>
                                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                            mapOption = {
                                                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                                level: 5 // 지도의 확대 레벨
                                            };

                                        //지도를 미리 생성
                                        var map = new daum.maps.Map(mapContainer, mapOption);
                                        //주소-좌표 변환 객체를 생성
                                        var geocoder = new daum.maps.services.Geocoder();
                                        //마커를 미리 생성
                                        var marker = new daum.maps.Marker({
                                            position: new daum.maps.LatLng(37.537187, 127.005476),
                                            map: map
                                        });


                                        function sample5_execDaumPostcode() {
                                            new daum.Postcode({
                                                oncomplete: function (data) {
                                                    var addr = data.address; // 최종 주소 변수

                                                    // 주소 정보를 해당 필드에 넣는다.
                                                    document.getElementById("sample5_address").value = addr;
                                                    // 주소로 상세 정보를 검색
                                                    geocoder.addressSearch(data.address, function (results, status) {
                                                        // 정상적으로 검색이 완료됐으면
                                                        if (status === daum.maps.services.Status.OK) {

                                                            var result = results[0]; //첫번째 결과의 값을 활용

                                                            // 해당 주소에 대한 좌표를 받아서
                                                            var coords = new daum.maps.LatLng(result.y, result.x);
                                                            // 지도를 보여준다.
                                                            mapContainer.style.display = "block";
                                                            map.relayout();
                                                            // 지도 중심을 변경한다.
                                                            map.setCenter(coords);
                                                            // 마커를 결과값으로 받은 위치로 옮긴다.
                                                            marker.setPosition(coords)
                                                        }
                                                    });
                                                }
                                            }).open();
                                        }
                                    </script>

                                    <br />
                                    <p>
                                        <hr />
                                    </p>

                                    <asp:Label runat="server" Text="이메일" CssClass="form_left"></asp:Label>
                                    <asp:TextBox ID="email" runat="server" CssClass="form_right" Width="130px"></asp:TextBox>
                                    @
                    <asp:TextBox ID="domainText" runat="server" CssClass="form_right" Width="170px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="other" ErrorMessage="이메일을 입력하세요." ControlToValidate="email" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>
                                    <%--이메일 DropDownList--%>
                                    <asp:DropDownList runat="server" ID="EmailList" OnSelectedIndexChanged="EmailList_OnSelectedIndexChanged" AutoPostBack="True" Font-Size="16pt">
                                        <asp:ListItem>- 직접입력 -</asp:ListItem>
                                        <asp:ListItem>naver.com</asp:ListItem>
                                        <asp:ListItem>daum.net</asp:ListItem>
                                        <asp:ListItem>google.co.kr</asp:ListItem>
                                    </asp:DropDownList>
                                                       </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:Label runat="server" Text="" CssClass="form_left"></asp:Label>
                                    <asp:Button ID="find_info_B" runat="server" Text="인증번호 전송" OnClick="Find_info" /><br />
                                    <asp:TextBox ID="check_code_T" runat="server" placeholder="인증번호 입력" MaxLength="20" Visible="false"></asp:TextBox>
                                    <asp:Button ID="check_code_B" runat="server" Text="인증번호 확인" Visible="false" OnClick="Insert_CheCode" />
                                    <asp:HiddenField runat="server" ID="checkV" Value="0"/>
                                    <asp:HiddenField runat="server" ID="sum_email" />

                                    <p>
                                        <hr />
                                    </p>
             
                            <asp:Label runat="server" Text="학교" CssClass="form_left"></asp:Label>
                            <asp:TextBox ID="school" runat="server" CssClass="form_right" Width="130px" ReadOnly="true"></asp:TextBox>
                            <asp:DropDownList runat="server">
                                <asp:ListItem>
                                </asp:ListItem>
                            </asp:DropDownList>

                            <p>
                                <hr />
                            </p>

                            <asp:Label runat="server" Text="학과" CssClass="form_left"></asp:Label>
                            <asp:TextBox ID="major" runat="server" CssClass="form_right" Width="130px" ReadOnly="true"></asp:TextBox>
                            <asp:DropDownList runat="server">
                                <asp:ListItem>
                                </asp:ListItem>
                            </asp:DropDownList>

                            <p>
                                <hr />
                            </p>
                            <br />
                            <br />

                            <div class="row">
                                <div class="col-2"></div>
                                <div class="col-8">
                                    <asp:Button ID="Button1" runat="server" Text="취소" Height="60px" Width="190px" CssClass="signup_data_btn1" OnClick="Btn_Click" />
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
