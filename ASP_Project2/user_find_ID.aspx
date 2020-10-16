<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="user_find_ID.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script runat="server">
    </script>
    <script>
        function StartTimer() {
        var time = 300;

        var x = setInterval(function () {
            min = parseInt(time / 60); sec = time % 60;
            document.getElementById("settime").innerHTML = "남은시간 : " +  min + ":" + sec + " <br>(시간내 미 입력시 재인증 하셔야합니다.)";
            time--;
            if (time < 0) {
                clearInterval(x); 
                alert("입력시간이 초과되었습니다. 재인증바랍니다.");
                location.href=history.back();
            }
        }, 1000);
        }
    </script>
    <div id="Find_Center">
        <div id="Find_Border">
            <div>
                <asp:Label ID="ment" runat="server">가입시 입력한 이메일을 입력해주세요.</asp:Label>
            </div>
            <hr />
            <asp:TextBox ID="find_info_T" runat="server" placeholder="Email" MaxLength="20"></asp:TextBox>
            <asp:Button ID="find_info_B" runat="server" Text="인증번호 전송" OnClick="Find_info" />
            <asp:TextBox ID="check_code_T" runat="server" placeholder="인증번호 입력" MaxLength="20" Visible="false"></asp:TextBox>
            <asp:Button ID="check_code_B" runat="server" Text="인증번호 확인" Visible="false" OnClick="Insert_CheCode" /><br />
            <div id="settime"></div><%--<asp:Button ID="retry" runat="server" Text="재전송" Visible="false" OnClick="Retry" /><br />--%>
            <asp:HiddenField runat="server" ID="checkV" />
            <asp:Label runat="server" ID="output"></asp:Label>
            <asp:Label runat="server" ID="Resultlbl" Text="회원님의 아이디는 " Visible="false"></asp:Label>
            <asp:Label runat="server" ID="ResultIDlbl"></asp:Label>
            <asp:Label runat="server" ID="Resultlbl2" Text=" 입니다." Visible="false"></asp:Label>
            <asp:Button ID="gotomain" runat="server" visible="false" Text="메인페이지로" OnClick="goto_main" />
            <br />
        </div>

    </div>
</asp:Content>


