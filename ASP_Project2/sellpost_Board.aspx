<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="sellpost_Board.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="imageboard">
        <%--검색기능--%>
        <asp:ImageButton ImageUrl="icon/book.png" Width="110px" Height="90px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="구매게시판" Font-Size="26pt" Font-Bold="True"></asp:Label>
        <br />
        <div id="search_div">
            <asp:DropDownList ID="search_object" runat="server" Height="45px" Width="17%">
                <asp:ListItem Value="title">제목</asp:ListItem>
                <asp:ListItem Value="name">작성자</asp:ListItem>
                <asp:ListItem Value="contents">내용</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="SearchBox" runat="server" TextMode="SingleLine" placeholder="검색할 내용을 입력해주세요." CssClass="section_search_textbox" BorderWidth="0" Width="70%" Height="45px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" ImageUrl="icon/search.png" OnClick="Search_Click" Width="45px" Height="45px" runat="server" ImageAlign="AbsMiddle" />
        </div>
        <br />
        <%--카테고리 영역--%>
		<div style="border:none; background-color: #f5f5f5">
		<table border="0" style="width: 95%; height: 300px; table-layout:fixed; margin: auto 20px auto 20px;"> <%--text-align: center--%>
		<tr>
		   <td colspan="7"><p></p></td>
		</tr>
		<tr>
		   <th colspan="7" style="font-size: 16pt">
			■대학교재
		   </th>
		</tr>
		<tr>
		   <th style="background-color: #e8e8e8; font-size: 14pt;">
			공학
		   </th>
		   <th style="background-color: #e8e8e8; font-size: 14pt;">
			인문
		   </th>
		   <th style="background-color: #e8e8e8; font-size: 14pt;">
			교육
		   </th>
		   <th style="background-color: #e8e8e8; font-size: 14pt;">
			사회
		   </th>
		   <th style="background-color: #e8e8e8; font-size: 14pt;">
			예체능
		   </th>
		   <th style="background-color: #e8e8e8; font-size: 14pt;">
			의학
		   </th>
		   <th style="background-color: #e8e8e8; font-size: 14pt;">
			자연
		   </th>
		</tr>
		<tr>
		   <td>
			건축
		   </td>
		   <td>
			언어/문학
		   </td>
		   <td>
			교육일반
		   </td>
		   <td>
			경영/경제
		   </td>
		   <td>
			디자인
		   </td>
		   <td>
			간호
		   </td>
		   <td>
			농림/수산
		   </td>
		</tr>
		<tr>
		   <td>
			교통/운송
		   </td>
		   <td>
			인문과학
		   </td>
		   <td>
			유아교육
		   </td>
		   <td>
			법률
		   </td>
		   <td>
			무용/체육
		   </td>
		   <td>
			약학
		   </td>
		   <td>
			생물/화학/환경
		   </td>
		</tr>
		<tr>
		   <td>
			기계/금속
		   </td>
		   <td>
		
		   </td>
		   <td>
			중등교육
		   </td>
		   <td>
			사회과학
		   </td>
		   <td>
			미술/조형
		   </td>
		   <td>
			의료
		   </td>
		   <td>
			생활과학
		   </td>
		</tr>
		<tr>
		   <td>
			산업
		   </td>
		   <td>
		
		   </td>
		   <td>
			초등교육
		   </td>
		   <td>
		
		   </td>
		   <td>
			연극/영화
		   </td>
		   <td>
			치료/보건
		   </td>
		   <td rowspan="2">
			수학/물리/천문/지리
		   </td>
		</tr>
		<tr>
		   <td>
			소재/재료
		   </td>
		   <td>
		
		   </td>
		   <td>
			특수교육
		   </td>
		   <td>
		
		   </td>
		   <td>
			음악
		   </td>
		   <td>
		
		   </td>
<%--		   <td>
		
		   </td>--%>
		</tr>
		<tr>
		   <td>
			전기/전자
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
			응용예술
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		</tr>
		<tr>
		   <td>
			정밀/에너지
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		</tr>
		<tr>
		   <td>
			컴퓨터/통신
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		</tr>
		<tr>
		   <td>
			토목/도시
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		</tr>
		<tr>
		   <td>
			화공
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		</tr>
		<tr>
		   <td>
			기타
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		   <td>
		
		   </td>
		</tr>
		<tr>
		   <td colspan="7"><p></p></td>
		</tr>
		</table>
	</div>
       <%-- <table border="1" style="width: 100%; height: 300px;">
            <tr>
                <td>

                </td>
            </tr>
            <tr>
                <td>

                </td>
            </tr>
            <tr>
                <td>

                </td>
            </tr>
        </table>--%>
        <br />
        <%-- 데이터 바인딩 --%>
        <asp:DataList ID="sellpost" runat="server" RepeatColumns="1" RepeatDirection="Vertical" CellPadding="10" CellSpacing="10" HorizontalAlign="Center" GridLines="Both" Width="100%" ItemStyle-Width="300px" ItemStyle-VerticalAlign="Middle" RepeatLayout="Table" ItemStyle-BorderStyle="None" BorderStyle="None">
            <ItemTemplate>
                <table border="0" style="padding: 5px; text-align: center;">
                    <tr>
                        <td rowspan="4" style="width: 13%; height: 180px">
                            <a href="<%# "sellpost_View.aspx?No=" + Eval("num")%>">
                                <asp:Image ID="recentImg" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Width="100%" Height="100%" ImageAlign="Middle" /></a>
                        </td>
                        <td rowspan="2" style="width: 200px; height: 25px; text-align:left; font-size:16pt">&nbsp;
							<a href="<%# "sellpost_View.aspx?No=" + Eval("num")%>"><%# Eval("title") %></a>
                            <asp:HiddenField runat="server" ID="pay_code_che" />
                            <asp:ImageButton Visible='<%#User.Identity.IsAuthenticated %>' ID="NewIcon" runat="server" ImageUrl="icon/newicon1.jpg" Height="15px" Width="15px" />
                            <asp:ImageButton Visible='<%#User.Identity.IsAuthenticated %>' ID="dealing_img" runat="server" ImageUrl="icon/price-tag-1.png" Height="20px" Width="20px" />
                        </td>
                        <td rowspan="2" style="width: 12%; height: 25px; font-size:15pt;">
							<%# Eval("price") %> 원
                        </td>
                        <td rowspan="2" style="width: 11.5%; height: 25px; font-size:15pt;">
							<%# Eval("status") %>
                        </td>
						<td rowspan="2" style="width: 20%; height: 25px; font-size:15pt;">
							<%# Eval("pay_code")%>
						</td>
                    </tr>
                    <tr>
                        <%--<td style="width: 200px; height: 40px; text-align:left;">
                            제목
                        </td>
                        <td style="width: 7%; height: 40px;">
                            가격
                        </td>
                        <td style="width: 10%; height: 40px;">
                            책 품질
                        </td>
						<td style="width: 50%; height: 40px;">
							거래상태
						</td>--%>
                    </tr>
                    <tr>
                        <td rowspan="2" style="width: 50%; height: 100px; text-align: left;">&nbsp;&nbsp;
							<%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("contents").ToString().Substring(0, 7)+"..." %>'></asp:Label>    --%>
                            <%# Eval("contents")%>
                        </td>
                        <td style="font-size:14pt; text-align:right;">작성자: &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td style="font-size: 14pt">
							<%# Eval("name")%>
                        </td>
						<td rowspan="2" style="font-size: 14pt">조회: 
							<%# Eval("readcount")%>
						</td>
                    </tr>
                    <tr>
                        <%--<td style="width: 60%; height: 100px; text-align: left;">
							게시글 내용
                        </td>--%>
                        <td style="font-size:14pt; text-align:right;">
                            작성일자: &nbsp;
                        </td>
                        <td style="font-size: 14pt">
                            <%# Eval("writedate")%>
                        </td>
						<%--<td>
							
						</td>--%>
                    </tr>
                </table>
				<br />
				<hr />
            </ItemTemplate>
        </asp:DataList>

		 <div style="width: 100%; text-align: center;margin-top:50px;">
            <asp:LinkButton ID="lnkPrevious" runat="server" OnClick="lnkPrevious_Click">이전페이지</asp:LinkButton>
            <asp:Label runat="server" Text="  ㅣ  "></asp:Label>
            <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">다음페이지</asp:LinkButton><br />
        </div>

        <asp:Label runat="server" ID="test1"></asp:Label>
        <asp:Label runat="server" ID="test2"></asp:Label>
        <asp:Label runat="server" ID="test3"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>


