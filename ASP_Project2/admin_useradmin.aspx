<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="admin_useradmin.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="imageboard">
        <h1 style="text-align: center;">관리자명단은 해당 차트에 표시하지않습니다.</h1>
        <br />
        <asp:GridView ID="userinfo" runat="server" AutoGenerateColumns="False" DataKeyNames="id" EnableModelValidation="True"
            AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" OnRowDeleting="userinfo_RowDeleting" OnRowUpdating="userinfo_RowUpdating">
            <Columns>
                <asp:BoundField DataField="super" HeaderText="권한" ReadOnly="True" SortExpression="super" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="id" HeaderText="아이디" ReadOnly="True" SortExpression="id" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="nickname" HeaderText="닉네임" SortExpression="nickname" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="name" HeaderText="이름" SortExpression="name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="phone" HeaderText="핸드폰번호" SortExpression="phone" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="address" HeaderText="주소" SortExpression="address" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="email" HeaderText="이메일" SortExpression="email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" HeaderText="회원탈퇴">
                    <ItemTemplate>
                        <asp:Button runat="server" CommandName="delete" Text="회원탈퇴" Height="67px" OnClick="Del_user" OnClientClick="return confirm('정말로 회원탈퇴 시키겠습니까?'); " />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" HeaderText="권한부여">
                    <ItemTemplate>
                        <asp:Button ID="ChangeGrant" CommandName="update" runat="server" Text="관리자권한" Height="67px" OnClick="ChangeGrant_Click" OnClientClick="return confirm('관리자 권한을 부여하시겠습니까?');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="false" ButtonType="Button" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="White" HeaderStyle-BorderWidth="0" ItemStyle-BorderWidth="0" />
                <asp:CommandField ShowEditButton="false" ButtonType="Button" ItemStyle-BorderWidth="0" HeaderStyle-BackColor="White" HeaderStyle-BorderWidth="0" HeaderStyle-ForeColor="White" />
                <%--차트에 관리자도 표시할 경우 아래 주석 풀것--%>
                <%-- <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" HeaderText="관리자 권한부여">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Update" Text="관리자 권한부여" OnClientClick="return confirm('관리자 권한을 부여하시겠습니까?'); "></asp:LinkButton>
                        <asp:DropDownList ID="Grantlist" runat="server" Height="67px" Width="100%" AutoPostBack="True" SelectedValue='<%# Eval("super") %>'>
                            <asp:ListItem>관리자</asp:ListItem>
                            <asp:ListItem>일반계정</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

