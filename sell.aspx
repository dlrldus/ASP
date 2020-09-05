<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="sell.aspx.cs" Inherits="sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="sell_contatiner">
        <br />
        <br />
        <br />
        <div id="text_f">판매하기 글 작성하기</div>
        <br />
        <asp:Label ID="Label5" runat="server" Text="작성자" CssClass="sell_left"></asp:Label>
        <asp:TextBox ID="name" runat="server" ReadOnly="True" Height="30px" CssClass="text_ff"></asp:TextBox>

        <asp:Label ID="Label6" runat="server" Text="이메일" CssClass="sell_left"></asp:Label>
        <asp:TextBox ID="email" runat="server" ReadOnly="True" Height="30px" CssClass="text_ff"></asp:TextBox>
        <p></p>

        <asp:Label ID="Label1" runat="server" Text="제목" CssClass="sell_left"></asp:Label>
        <asp:TextBox ID="title" runat="server" Placeholder="게시글 제목을 입력하세요" CssClass="sell_right"></asp:TextBox>

        <p></p>

        <br />
        <br />

        <asp:TextBox ID="contents" runat="server" TextMode="MultiLine" Height="500px" Width="90%" CssClass="sell_content_left"></asp:TextBox>

        <p></p>
        <div id="sub_select">
            <asp:Label ID="Label7" runat="server" Text="판매가격" CssClass="sell_tag_left"></asp:Label>
            <asp:TextBox ID="price" runat="server" CssClass="text_ff"></asp:TextBox>
            <p></p>

            <asp:Label ID="Label3" runat="server" Text="태그" CssClass="sell_tag_left"></asp:Label>
            <asp:TextBox ID="tag" runat="server" CssClass="text_ff"></asp:TextBox>

            <p></p>
            <asp:Label ID="Label2" runat="server" Text="사진 첨부" CssClass="sell_left"></asp:Label>
            <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sell_right" Height="60%" />

            <p></p>


            <asp:Label ID="Label4" runat="server" Text="공개설정" CssClass="sell_left"></asp:Label>
            전체공개<asp:RadioButton runat="server" CssClass="sell_radio_right"></asp:RadioButton>
            회원공개<asp:RadioButton runat="server" CssClass="sell_radio_right"></asp:RadioButton>
            <p></p>
            <br />
        </div><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Button1" runat="server" Text="취소" Height="60px" Width="130px" CssClass="sell_button_cancle" />
        <asp:Button ID="Upload" runat="server" Text="확인" Height="60px" Width="130px" CssClass="sell_button_apply" OnClick="btnWrite_Click" />
    </div>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

    <div id="summernote"></div>
    <script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 50,
          height: 900

      });

        $("#content").summernote()
        $('.dropdown-toggle').dropdown()

        // ------------ 이하 테스트구문 --------------- // 
        $('#summernote').summernote('code', document.getElementById("summer_T").value); // 쿼리 히든필드에 값 삽입
        $('#summernote').summernote('code', document.getElementById("textlabel").text); // 쿼리 테스트라벨에 값 삽입

        // 히든필드, 테스트라벨에 값 삽입 함수 
        function summer_text() {
            document.getElementById("summer_T").value = $('#summernote').summernote('code');
            document.getElementById("textlabel").text = $('#summernote').summernote('code');
        }
        // ------------ 테스트구문 종료 --------------- // 
    </script>

    <asp:HiddenField runat="server" ID="summer_T" />
    <asp:Label runat="server" ID="textlabel" Text="테스트라벨"></asp:Label>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

