<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="sellpost_Write.aspx.cs" Inherits="sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <br />
        <div id="algincenter">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Label ID="Label3" runat="server" Text="판매 글 작성" CssClass="text_requestform"></asp:Label>
            <%--<fieldset class="py-4" style="border: solid #996600; background-color: #f5f6f7">
                <div class="row">--%>
                    <%--row를 선언 후 col를 이용하여 여백을 나타낸다. --%>
                    <%--<div class="col-1"></div>--%>
                    <%--총 12개의 md중 2개의 크기를 가장 왼쪽에 부여(2개의 크기만큼 여백) --%>
                    <%--<div class="col-11">--%>
                        <%--총 12개의 md중 8개의 크기를 로고 사용에 지정 --%>
                    <br />
                     <asp:Table ID="Table1" runat="server" CssClass="table">
                         <asp:TableRow>
                             <asp:TableCell CssClass="column_text">
                                 <asp:Label ID="Label9" runat="server" Text="작성자" CssClass="sell_left"></asp:Label>                       
                             </asp:TableCell>
                             <asp:TableCell>
                                 <asp:TextBox ID="nickname" runat="server" ReadOnly="True" Height="30px" BorderStyle="None"></asp:TextBox>
                             </asp:TableCell>
                         </asp:TableRow>
                         <asp:TableRow>
                             <asp:TableCell CssClass="column_text">
                                 <asp:Label ID="Label10" runat="server" Text="이메일" CssClass="sell_left"></asp:Label>                      
                             </asp:TableCell>
                             <asp:TableCell>
                                 <asp:TextBox ID="email" runat="server" ReadOnly="True" Height="30px" BorderStyle="None"></asp:TextBox>
                             </asp:TableCell>
                         </asp:TableRow>
                         <asp:TableRow>
                             <asp:TableCell CssClass="column_text">
                                 <asp:Label ID="Label4" runat="server" Text="제목"></asp:Label>
                             </asp:TableCell>
                             <asp:TableCell>
                                 <asp:TextBox ID="title" runat="server" Placeholder="제목을 입력하세요" CssClass="sell_right" Width="70%"></asp:TextBox>
                             </asp:TableCell>
                         </asp:TableRow>
                         <asp:TableRow>
                             <asp:TableCell CssClass="column_text">
                                 <asp:Label ID="Label13" runat="server" Text="분야선택"></asp:Label>
                             </asp:TableCell>
                             <asp:TableCell>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label14" runat="server" Text="--대분류--"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label15" runat="server" Text="--중분류--"></asp:Label><br />
                                        <asp:DropDownList ID="category_f" runat="server" Width="15%" OnSelectedIndexChanged="category_f_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:HiddenField runat="server" ID="cate_f" />&nbsp;&nbsp;
                                        
                                        <asp:DropDownList ID="category_s" runat="server" Width="15%" OnSelectedIndexChanged="category_s_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        <asp:HiddenField runat="server" ID="HiddenField1" />
                                        <asp:HiddenField runat="server" ID="cate_s" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                             </asp:TableCell>
                         </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="column_text">
                                <asp:Label ID="Label5" runat="server" Text="책품질"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="Book_status" runat="server" Width="15%">
                            <asp:ListItem Value="0" Selected="True">-</asp:ListItem>
                            <asp:ListItem Value="1">미개봉</asp:ListItem>
                            <asp:ListItem Value="2">매우 좋음</asp:ListItem>
                            <asp:ListItem Value="3">좋음</asp:ListItem>
                            <asp:ListItem Value="4">양호</asp:ListItem>
                            <%--https://sellercentral.amazon.es/gp/help/external/200339950?language=ko_KR&ref=efph_200339950_cont_521/--%>
                        </asp:DropDownList>
                        <asp:HiddenField runat="server" ID="HBook_status" />
                            </asp:TableCell>
                        </asp:TableRow>                        
                         <asp:TableRow>
                            <asp:TableCell CssClass="column_text">
                                <asp:Label ID="Label2" runat="server" Text="사진 첨부" CssClass="sell_left" Width="70px"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:FileUpload ID="ImageUpload" runat="server"  CssClass="request_right" Height="60%"/>
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                             <asp:TableCell CssClass="column_text">
                                 <asp:Label ID="Label6" runat="server" Text="내용"></asp:Label>
                             </asp:TableCell>
                             <asp:TableCell>
                                  <asp:TextBox ID="contents" runat="server" TextMode="MultiLine" Height="500px" Width="100%" CssClass="sell_content_left"
                            Placeholder="내용을 입력하세요"></asp:TextBox>
                             </asp:TableCell>
                         </asp:TableRow>
                         <asp:TableRow>
                             <asp:TableCell CssClass="column_text">
                                 <asp:Label ID="Label8" runat="server" Text="공개설정"></asp:Label>
                             </asp:TableCell>
                             <asp:TableCell>
                                 <%--요청글작성의 공개설정--%>
                                    <asp:Label ID="Label11" runat="server" Text="전체공개" CssClass="sell_radio_right"></asp:Label>&nbsp;
                                    <asp:RadioButton ID="gopub_all" runat="server" CssClass="sell_radio_right" GroupName="go_public" Checked="True"></asp:RadioButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label12" runat="server" Text="회원공개" CssClass="sell_radio_right"></asp:Label>&nbsp;
                                    <asp:RadioButton ID="gopub_mem" runat="server" CssClass="sell_radio_right" GroupName="go_public"></asp:RadioButton>
                                    <asp:HiddenField runat="server" ID="gopub" />
                                <%--<asp:DropDownList ID="DropDownList1" runat="server" Width="15%">
                                    <asp:ListItem Value="0" Selected="True">radio?</asp:ListItem>
                                    <asp:ListItem Value="1">전체공개</asp:ListItem>
                                    <asp:ListItem Value="2">회원공개</asp:ListItem>
                                </asp:DropDownList>--%>
                             </asp:TableCell>
                         </asp:TableRow>                     
                            <asp:TableRow>
                                <asp:TableCell CssClass="column_text">
                                    <asp:Label ID="Label7" runat="server" Text="판매가격" CssClass="sell_tag_left" Width="70px"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>                                                                        
                                    <asp:TextBox ID="price" runat="server" CssClass="sell_tag_middle text-right"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text=" 원"></asp:Label>
                                </asp:TableCell>                            
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <asp:CheckBox runat="server" ID="che_map" Style='zoom: 1.5;' />&nbsp;
                                    <asp:Label ID="Label16" runat="server" Text="위치정보 제공 동의" Font-Size="13.5pt"></asp:Label>&nbsp;
                                    <asp:Label runat="server" Text="*체크할경우 해당 판매글에는 판매자의 위치가 게시글에 등록됩니다. (구매자가 판매자의 위치를 파악하여 신속한 직거래가 가능합니다.)" Font-Bold="False" ForeColor="Red" Font-Size="9pt"></asp:Label>
                                    <asp:HiddenField runat="server" ID="lati" />
                                    <asp:HiddenField runat="server" ID="longi" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>                      

                            <asp:Button ID="Cancel" runat="server" Text="취소" Height="50px" Width="12%" CssClass="request_button_cancle" OnClick="Cancel_Click" />
                            <asp:Button ID="Upload" runat="server" Text="확인" Height="50px" Width="12%" CssClass="request_button_apply" OnClick="btnWrite_Click" />

                    </div>

                </div>
<%--            </fieldset>
        </div>

    </div>--%>
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

