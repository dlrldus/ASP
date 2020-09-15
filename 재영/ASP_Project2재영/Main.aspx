<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
	<div class="row">
		
		<div class="col-11">
		
   <style>
	*{margin:0;padding:0;}
	ul,li{list-style:none;}
	#slide{height:300px;position:relative;overflow:hidden;}
	#slide ul{width:400%;height:100%;transition:1s;}
	#slide ul:after{content:"";display:block;clear:both;}
	#slide li{float:left;width:25%;height:100%;}
	#slide li:nth-child(1){background-image:url('Images/logo_header.png')}
	#slide li:nth-child(2){background-image:url('Images/logo2.jpg')}
	#slide li:nth-child(3){background-image:url('Images/cat1.jpg')}
	#slide li:nth-child(4){background-image:url('Images/cat2.jpg')}
	#slide input{display:none;}
	#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	#slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	#pos1:checked~ul{margin-left:0%;}
	#pos2:checked~ul{margin-left:-100%;}
	#pos3:checked~ul{margin-left:-200%;}
	#pos4:checked~ul{margin-left:-300%;}
	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	#pos4:checked~.pos>label:nth-child(4){background:#666;}
</style>
<div id="slide">
	<input type="radio" name="pos" id="pos1" checked>
	<input type="radio" name="pos" id="pos2">
	<input type="radio" name="pos" id="pos3">
	<input type="radio" name="pos" id="pos4">
	<ul>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	<p class="pos">
		<label for="pos1"></label>
		<label for="pos2"></label>
		<label for="pos3"></label>
		<label for="pos4"></label>
	</p>
</div>
			</div>
        
		<div class="col-1"></div>
		</div>
    <br />
    <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="최근 판매글" Font-Size="32pt" Font-Bold="True"></asp:Label>
    <br />
	<asp:GridView ID="sellpost" runat="server" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="sellpostData" EnableModelValidation="True" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="num" HeaderText="게시글번호" InsertVisible="False" ReadOnly="True" SortExpression="num" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" Width="180px"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="이미지" ItemStyle-Width="100px" ItemStyle-Height="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader">
                    <ItemTemplate>
                        <a href="<%# "View.aspx?No=" + Eval("num")%>">
                            <asp:Image ID="imggeUpload" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Height="150px" Width="160px" /></a>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center" CssClass="PostHeader"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" Height="150px" Width="140px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a href="<%# "View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="price" HeaderText="판매자 희망가격" SortExpression="writedate" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader">
                    <HeaderStyle HorizontalAlign="Center" CssClass="PostHeader"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" Width="200px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="작성자" SortExpression="name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader">
                    <HeaderStyle HorizontalAlign="Center" CssClass="PostHeader"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="writedate" HeaderText="작성일" SortExpression="writedate" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader">
                    <HeaderStyle HorizontalAlign="Center" CssClass="PostHeader"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="readcount" HeaderText="조회수" SortExpression="readcount" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader">
                    <HeaderStyle HorizontalAlign="Center" CssClass="PostHeader"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle ForeColor="#003399" BackColor="White" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:GridView>
    <asp:SqlDataSource ID="sellpostData" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString %>" SelectCommand="SELECT [num], [name], [title], [writedate], [readcount], [image] FROM [sellpost] ORDER BY [num] DESC"></asp:SqlDataSource>

    <br />
    <asp:ImageButton ImageUrl="icon/square.png" Width="60px" Height="60px" runat="server" ImageAlign="AbsMiddle" />
        <asp:Label runat="server" Text="최근 요청글" Font-Size="32pt" Font-Bold="True"></asp:Label>
    <br />
    <asp:GridView ID="requestpost_View" runat="server" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="requestpost" EnableModelValidation="True"
            AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center" Width="100%">
            <Columns>
                <asp:BoundField DataField="num" HeaderText="게시글번호" InsertVisible="False" ReadOnly="True" SortExpression="num" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" />
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a href="<%# "request_View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="이름" SortExpression="name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="writedate" HeaderText="작성일" SortExpression="writedate" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="readcount" HeaderText="조회수" SortExpression="readcount" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
     <asp:SqlDataSource ID="requestpost" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString %>" SelectCommand="SELECT [num], [title], [name], [writedate], [readcount] FROM [requestpost] ORDER BY [num] DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>
