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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ID" ErrorMessage="아이디를 입력하세요." ControlToValidate="id" Display="dynamic" CssClass="required"></asp:RequiredFieldValidator>

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

                            <asp:Label runat="server" Text="닉네임" CssClass="form_left"></asp:Label>
                            <asp:TextBox ID="nickname" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                            <asp:Button runat="server" ID="NickCheck" Text="중복체크" OnClick="NickCheck_Click" CssClass="IDCheck_btn2" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="nickname" ErrorMessage="닉네임을 입력하세요." ControlToValidate="nickname" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                            <p>
                                <hr />
                            </p>

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
                            <asp:DropDownList ID="lstYear" runat="server" OnSelectedIndexChanged="lstYear_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>년
                    <asp:DropDownList ID="lstMonth" runat="server" OnSelectedIndexChanged="lstMonth_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>월
                    <asp:DropDownList ID="lstDay" runat="server"></asp:DropDownList>일

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
                            <asp:DropDownList runat="server" ID="phone" OnSelectedIndexChanged="phoneList_OnSelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>SKT</asp:ListItem>
                                <asp:ListItem>KT</asp:ListItem>
                                <asp:ListItem>LG U+</asp:ListItem>
                            </asp:DropDownList>

                            <p>
                                <hr />
                            </p>

                            <asp:Label runat="server" Text="주소" CssClass="form_left"></asp:Label>
                 <%--   <asp:TextBox ID="address" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="other" ErrorMessage="주소를 입력하세요." ControlToValidate="address" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>--%>
                    <%--다음 도로명주소 API--%>
                   <%-- <asp:Button runat="server" onClick="sample4_execDaumPostcode()" />--%>
<%--요기주석따로
                    <asp:TextBox runat="server" ID="sample4_roadAddress" Placeholder="도로명주소" Width="300px"></asp:TextBox>
                    <input type="hidden" id="sample4_postcode" <%--placeholder="우편번호"
                    <asp:TextBox runat="server" ID="sample4_detailAddress" Placeholder="상세주소"></asp:TextBox>
                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                    <asp:HiddenField runat="server" ID="address_sum" />--%>

                      <%--  <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
                    <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
                    <span id="guide" style="color: #999; display: none"></span>
                    <input type="text" id="sample4_detailAddress" placeholder="상세주소">
                    <input type="text" id="sample4_extraAddress" placeholder="참고항목">--%>
                       
                   <%-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <script>
                        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                        function sample4_execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function (data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                                    var extraRoadAddr = ''; // 참고 항목 변수

                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                        extraRoadAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if (data.buildingName !== '' && data.apartment === 'Y') {
                                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if (extraRoadAddr !== '') {
                                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('sample4_postcode').value = data.zonecode;
                                    document.getElementById("sample4_roadAddress").value = roadAddr;
                                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                    if (roadAddr !== '') {
                                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                                    } else {
                                        document.getElementById("sample4_extraAddress").value = '';
                                    }

                                    var guideTextBox = document.getElementById("guide");
                                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                    if (data.autoRoadAddress) {
                                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                        guideTextBox.style.display = 'block';

                                    } else if (data.autoJibunAddress) {
                                        var expJibunAddr = data.autoJibunAddress;
                                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                                        guideTextBox.style.display = 'block';
                                    } else {
                                        guideTextBox.innerHTML = '';
                                        guideTextBox.style.display = 'none';
                                    }
                                }
                            }).open();
                        }
                    </script>--%>

                            <asp:TextBox ID="sample5_address" runat="server" CssClass="form_right" Width="300px"></asp:TextBox><asp:TextBox runat="server" ID="TextBox1" Placeholder="상세주소"></asp:TextBox>
<%--                            <input type="text" id="sample5_address" placeholder="주소" style="width:400px;">   --%>                 
                            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br><br /><br />
<div id="map" style="width:300px;height:300px;display:none;margin:auto;border:3px double gray;"></div>

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
                            <asp:DropDownList runat="server" ID="EmailList" OnSelectedIndexChanged="EmailList_OnSelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>- 직접입력 -</asp:ListItem>
                                <asp:ListItem>naver.com</asp:ListItem>
                                <asp:ListItem>daum.net</asp:ListItem>
                                <asp:ListItem>google.co.kr</asp:ListItem>
                            </asp:DropDownList>

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
