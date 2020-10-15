<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="sellpost_Write.aspx.cs" Inherits="sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">

        <br />
        <div id="algincenter">

            <fieldset class="py-4" style="border: solid #996600; background-color: #f5f6f7">
                <div class="row">
                    <%--row를 선언 후 col를 이용하여 여백을 나타낸다. --%>
                    <div class="col-1"></div>
                    <%--총 12개의 md중 2개의 크기를 가장 왼쪽에 부여(2개의 크기만큼 여백) --%>
                    <div class="col-11">
                        <%--총 12개의 md중 8개의 크기를 로고 사용에 지정 --%>


                        <asp:TextBox ID="title" runat="server" Placeholder="제목을 입력하세요" CssClass="sell_right" Width="76%"></asp:TextBox><br /><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="15%">
                            <asp:ListItem Value="0" Selected="True">공개설정</asp:ListItem>
                            <asp:ListItem Value="1">전체공개</asp:ListItem>
                            <asp:ListItem Value="2">회원공개</asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:DropDownList ID="Book_status" runat="server" Width="15%">
                            <asp:ListItem Value="0" Selected="True">책품질</asp:ListItem>
                            <asp:ListItem Value="1">미개봉</asp:ListItem>
                            <asp:ListItem Value="2">매우 좋음</asp:ListItem>
                            <asp:ListItem Value="3">좋음</asp:ListItem>
                            <asp:ListItem Value="4">양호</asp:ListItem>
                            <%--https://sellercentral.amazon.es/gp/help/external/200339950?language=ko_KR&ref=efph_200339950_cont_521/--%>
                        </asp:DropDownList>
                        <asp:HiddenField runat="server" ID="HBook_status" />
                        <p></p> 

                        <asp:TextBox ID="contents" runat="server" TextMode="MultiLine" Height="500px" Width="91%" CssClass="sell_content_left"
                            Placeholder="내용을 입력하세요"></asp:TextBox>
                        <p></p>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="사 진" CssClass="sell_left" Width="70px"></asp:Label>
                                    <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sell_right" Width="80%" />
                                    <p></p>
                                    <asp:Label ID="Label7" runat="server" Text="판매가격" CssClass="sell_tag_left" Width="70px"></asp:Label>
                                    <asp:TextBox ID="price" runat="server" CssClass="sell_tag_middle text-right" Width="75%" BackColor="#E6E6E6" BorderColor="#CCCCCC" BorderWidth="1px"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="원"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="Cancel" runat="server" Text="취소" Height="5%" Width="25%" CssClass="signup_data_btn1" OnClick="Cancel_Click" />
                                    <asp:Button ID="Upload" runat="server" Text="확인" Height="5%" Width="25%" CssClass="signup_data_btn2" OnClick="btnWrite_Click" />

                                </td>
                            </tr>
                        </table>

                    </div>

                </div>
            </fieldset>
        </div>

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

