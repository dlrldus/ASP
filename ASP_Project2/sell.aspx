<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="sell.aspx.cs" Inherits="sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
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
    <asp:Label runat="server" ID="textlabel" Text="테스트라벨"></asp:Label>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

