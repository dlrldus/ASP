<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Index.master" AutoEventWireup="true" CodeFile="user_mypage_Myinfo.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <fieldset class="signup_fieldset py-4">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-9">
                <asp:Label runat="server" Text="" CssClass="form_left">아이디</asp:Label>
               <%-- <asp:TextBox ID="id" runat="server" CssClass="form_right" Width="300px" MaxLength="15" ReadOnly="true" BackColor="Silver"></asp:TextBox>--%>
                <asp:Label runat="server" ID="id" CssClass="form_right" Width="300px" MaxLength="15"></asp:Label>
                <p>
                    <hr />
                </p>
                <asp:Label runat="server" Text="비밀번호" CssClass="form_left"></asp:Label>
                <asp:TextBox ID="pwd" runat="server" CssClass="form_right" TextMode="Password" Width="300px"></asp:TextBox>
                <p>
                    <hr />
                </p>
                <asp:Label runat="server" Text="닉네임" CssClass="form_left"></asp:Label>
                <%--<asp:TextBox ID="nickname" runat="server" CssClass="form_right" Width="300px" ReadOnly="true" BackColor="Silver"></asp:TextBox>--%>
                 <asp:Label runat="server" ID="nickname" CssClass="form_right" Width="300px" MaxLength="15"></asp:Label>
                <p>
                    <hr />
                </p>
                <asp:Label runat="server" Text="이름" CssClass="form_left"></asp:Label>
                <%--<asp:TextBox ID="name" runat="server" CssClass="form_right" Width="300px" ReadOnly="true" BackColor="Silver"></asp:TextBox>--%>
                 <asp:Label runat="server" ID="name" CssClass="form_right" Width="300px" MaxLength="15"></asp:Label>
                <p>
                    <hr />
                </p>
                <asp:Label runat="server" Text="생년월일" CssClass="form_left"></asp:Label>
                <%--<asp:TextBox ID="birth" runat="server" Visible="true" AutoPostBack="True" Width="300px" ReadOnly="true" BackColor="Silver"></asp:TextBox>--%>
                 <asp:Label runat="server" ID="birth" CssClass="form_right" Width="300px" MaxLength="15"></asp:Label>
                <p></p>
                <hr />
                <asp:Label runat="server" Text="핸드폰 번호" CssClass="form_left"></asp:Label>
                <asp:TextBox ID="phonesum" runat="server" Visible="false" AutoPostBack="True"></asp:TextBox>
               <%-- <asp:TextBox ID="phone" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>--%>
                <asp:Label runat="server" ID="phone" CssClass="form_right" Width="300px" MaxLength="15"></asp:Label>

                <p>
                    <hr />
                </p>

                <asp:Label runat="server" Text="주소" CssClass="form_left"></asp:Label>
                <asp:TextBox ID="address" runat="server" Width="300px"></asp:TextBox>
                <br />
                <br />
                <asp:Label runat="server" CssClass="form_left"></asp:Label><div id="map" style="width: 300px; height: 300px; display: none; border: 3px double gray;"></div>
                <br />
                <p>
                    <hr />
                </p>
                <asp:Label runat="server" Text="이메일" CssClass="form_left"></asp:Label>
                <asp:Label runat="server" ID="email" CssClass="form_right" Width="300px" MaxLength="15"></asp:Label>
                <p>
                    <hr />
                </p>
                <asp:Label runat="server" Text="학교" CssClass="form_left"></asp:Label>
                <asp:TextBox ID="school" runat="server" CssClass="form_right" Width="300px" ReadOnly="true"></asp:TextBox>
                <asp:DropDownList runat="server">
                    <asp:ListItem>
                    </asp:ListItem>
                </asp:DropDownList>
                <p>
                    <hr />
                </p>
                <asp:Label runat="server" Text="학과" CssClass="form_left"></asp:Label>
                <asp:TextBox ID="major" runat="server" CssClass="form_right" Width="300px" ReadOnly="true"></asp:TextBox>
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
                        <asp:Button ID="Button1" runat="server" Text="취소" Height="60px" Width="190px" CssClass="signup_data_btn1" />
                        <asp:Button runat="server" ID="Update_Btn" Text="회원정보수정" Height="60px" Width="190px" CssClass="signup_data_btn2" OnClick="Update_Btn_Click" />
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>