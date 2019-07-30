<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../bootstrap.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#search {
	margin-left: 80px;
	margin-top: 30px;
	float: left;
	border: 3px solid navy;
	width: 500px !important;
	height: 30px !important;
}
#sidemenu {
	width: 250px;
	height: 400px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	text-align: center;
	background-color: white;
}
article {
	width: 750px;
	height: 800px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
}
button.sub_button {
	background-color: white;
	color: black;
	cursor: pointer;
	font-size: 14px;
	font-weight: bold;
	border-style: hidden;
	border-radius: 10px;
}
</style>
<script type="text/javascript">
/* function p1(a, b, c) {
	$('#disp').load("list.rb?pageNum="+ a +"&search=" + b + "$keyword="+c);
}
function p2(a, b, c) {
	$('#disp').load("list.rb?pageNum=" + a + "&search=" + b+ "$keyword="+c);
}
function p3(a, b, c) {
	$('#disp').load("list.rb?pageNum=" + a + "&search=" + b+ "$keyword="+c);
}
function p4(a, b, c) {
	$('#disp').load("list.rb?pageNum=" + a + "&search=" + b+ "$keyword="+c);
}
function p5(a, b, c) {
	$('#disp').load("list.rb?pageNum=" + a + "&search=" + b+ "$keyword="+c);
}
function p6(a, b, c) {
	$('#disp').load("list.rb?pageNum=" + a + "&search=" + b+ "$keyword="+c);
}
function f1(n, sub, key) {
	$('#disp').load(
			"list.rb?search=" + sub + "&keyword="
					+ key + "&pageNum="+n);
}
function f2(n, sub, key) {
	$('#disp').load(
			"list.rb?search=" + sub + "&keyword="
					+ key + "&pageNum=" + n);
}
function f3(n, sub, key) {
	$('#disp').load(
			"list.rb?search=" + sub + "&keyword="
					+ key + "&pageNum=" + n);
}
function f4(n, sub, key) {
	$('#disp').load(
			"list.rb?search=" + sub + "&keyword="
					+ key + "&pageNum=" + n);
}
function f5(n, sub, key) {
	$('#disp').load(
			"list.rb?search=" + sub + "&keyword="
					+ key + "&pageNum=" + n);
}
function f6(n, sub, key) {
	$('#disp').load(
			"list.rb?search=" + sub + "&keyword="
					+ key + "&pageNum=" + n);
} */
function rp(a, b) {
	$('#disp').load("view.rb?num=" + a + "&pageNum=" + b);
}
function rpInsert() {
	$('#disp').load("insertForm.rb?pageNum=1");
}
/* $(function() {
	$('#replView').click(function() {
		var sendData = "num="+$('#replNum').val()+"&pageNum="+$('#replPageNum').val();
		alert(sendData);
		$.post('view.rb', sendData,
		function(data) {
			$('#disp').html(data);
		});
	});
}); 이렇게하면 안됨!!*/
	$(function() {
		$('#rpSubmit').click(function() {
			var sendData = $('#rpForm').serialize();
			$.post('list.rb', sendData,
				function(data) {
					$('#disp').html(data);
				});
			return false;
		});
	});
</script>
</head><body><article>
<div class="container" align="center" >
	<h2 class="text-primary">자유게시판</h2>
<c:set var="num" value="${no }"></c:set>	
<table class="table table-striped" style="width: 900">
	<tr><td>번호</td><td>제목</td><td>작성자</td><td>조회수</td>
		<td>작성일</td></tr>
<c:if test="${empty list }">
	<tr><td colspan="5">데이터가 없습니다</td></tr>
</c:if>		
<c:if test="${not empty list }">
	<c:forEach var="board" items="${list }">
		<tr><td> ${board.num }
		<c:set var="num" value="${board.num - 1 }"></c:set>
		</td>
		<c:if test="${board.del=='y' }">
			<td colspan="4">삭제된 글입니다</td>
		</c:if>
		<c:if test="${board.del!='y' }">
			<td title="${board.content }">
			<c:if test="${board.re_level >0 }">
			<img src="${path}/images/level.gif" height="5"
				width="${board.re_level*10 }">
			<img alt="" src="${path}/images/re.gif">	
			</c:if>
			<c:if test="${board.readcount >30 }">
				<img alt="" src="${path}/images/hot.gif">
			</c:if>
			<input type="hidden" id="replNum" value="${board.num}">
			<input type="hidden" id="replPageNum" value="${pb.currentPage}">
			<button class="sub_button" onclick="rp('${board.num}','${pb.currentPage}')" id="replView">${board.subject }</button>
			</td>
			<td>${board.mem_id }</td>
			<td>${board.readcount }</td>
			<td>${board.reg_date }</td>
		</c:if></tr>
	</c:forEach>
</c:if>
</table>

<div align="center"><ul class="pagination">
	<c:if test="${pb.startPage > pb.pagePerBlock }">
		<li>
			<span class="glyphicon glyphicon-backward" onclick="f1(1,'${board.search}','${board.keyword}')"></span>
		</li>
		<li>
			<button onclick="f2('${pb.startPage -1}','${board.search}','${board.keyword}')"
			class="glyphicon glyphicon-triangle-left"></button>
		</li>
	</c:if>
	
	<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
		<c:if test="${i==pb.currentPage }">
			<li class="active">
				<a type="button" onclick="f3(${i},'${board.search}','${board.keyword}')">${i}</a>
			</li>
		</c:if>
		<c:if test="${i!=pb.currentPage }">
			<li>
				<a type="button" onclick="f4(${i},'${board.search}','${board.keyword}')">${i}</a>
			</li>
		</c:if>
	</c:forEach>
	
	<c:if test="${pb.endPage < pb.totalPage }">
		<li>
			<button onclick="f5(${pb.endPage+ 1},'${board.search}','${board.keyword}')">
				<span class="glyphicon glyphicon-triangle-right"></span>
			</button>
		</li>
		<li>
			<button onclick="f6(${pb.totalPage},'${board.search}','${board.keyword}')">
				<span class="glyphicon glyphicon-forward"></span>
			</button>
		</li>
	</c:if>
</ul>

<form action="" id="rpForm">
	<input type="hidden" name="pageNum" value="1"> 
	<select name="search">
		<c:forTokens var="sh" items="mem_id,subject,content,subcon" delims=","
			varStatus="i">
			<c:if test="${sh==board.search }">
				<option value="${sh}" selected="selected">${tit[i.index]}</option>
			</c:if>
			<c:if test="${sh!=board.search }">
				<option value="${sh}">${tit[i.index]}</option>
			</c:if>
		</c:forTokens>
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="확인" id="rpSubmit">
</form>
</div>
	<button class="btn btn-info" onclick="rpInsert()">게시글 입력</button>
</div>
</article>
</body>
</html>