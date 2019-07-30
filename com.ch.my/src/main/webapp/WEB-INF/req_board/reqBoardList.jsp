<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: grey;
}

table.side {
	border-collapse: separate;
	border-spacing: 0;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	margin: 20px 10px;
}
/* 
table.side th {
	width: 250px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
} */
table.side td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	/* text-align: center; */
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	font-size: 13px;
}

body {
	width: 950px;
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

#p1 {
	font-weight: lighter;
	font-size: 10px;
}

#loginbutton {
	height: 40px;
	width: 150px;
	background-color: #B4D0FC;
	float: none;
}

article {
	width: 650px;
	height: 800px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
}

table.reqbo {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	margin: 10px 10px;
	font-size: 13px;
}

table.reqbo th {
	/* width: 147px; */
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 3px solid #369;
}

table.reqbo td {
	/* width: 349px; */
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}


.out {
	 width: 60%;
	 text-align: center;
 }
.in {
	 display: inline-block;
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
button.top_button {
	color: black !important;
	cursor: pointer !important;
	font-size: 13px !important;
	font-weight: bold !important;
	border-style: hidden !important;
	border-radius: 10px !important;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#requestForm').click(function() {
			$.post('requestForm.up', 
			function(data) {
				$('#disp').html(data);
			});
			return false;
		});
	});
</script>
</head>
<body>
	<article>
		<table class="reqbo">
			<tr>
				<th>번호</th>
				<th width="50px">분류</th>
				<th width="200px">제목</th>
				<th width="70px">작성자</th>
				<th width="70px">날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="req_board" items="${list }">
				<c:if test="${req_board.board_del=='n' }">
					<tr>
						<td>${req_board.board_num }</td>
						<td>${req_board.category }</td>
						<td><c:if test="${req_board.board_readcount > 4}">
								<img alt="" src="images/hot.gif">
							</c:if> <c:if test="${req_board.board_re_level>0}">
								<c:forEach begin="1" end="${req_board.board_re_level}">
									<img alt="" src="images/level.gif" height="5px"
										width="${req_board.board_re_level*3}">
								</c:forEach>
								<img alt="" src="images/re.gif">
							</c:if> <a href="requestView.up?board_num=${req_board.board_num }">${req_board.board_subject }</td>
						<td>${req_board.mem_id }</td>
						<td>${req_board.board_re_date }</td>
						<td align="center">${req_board.board_readcount}</td>
					</tr>
				</c:if>
				<c:if test="${req_board.board_del=='y' }">
					<tr>
						<td colspan="6">삭제된 글입니다</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<button class="sub_button" onclick="r2(${startPage-1 })">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<button class="sub_button" onclick="r1(${i})">[${i}]</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<button class="sub_button" onclick="r3(${endPage+1 })">다음</button>
			</c:if>
		</div>
		<p>
			<a class="top_button" id="requestForm"><button class="top_button">자료 요청하기</button></a>
			<a class="top_button" href="main.do"><button class="top_button">메인으로</button></a>
	</article>
</body>
</html>