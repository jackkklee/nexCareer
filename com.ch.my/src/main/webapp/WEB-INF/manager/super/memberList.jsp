<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


table.manager {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	margin: 10px 10px;
	font-size: 13px;
}

table.manager th {
	/* width: 80px; */
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 2px solid #369;
}

table.manager td {
	/* width: 200px; */
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
a {
	text-decoration: none;
	color: black;
}

article {
	width: 850px;
	height: 900px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
}
a:hover {
	color: grey;
}
</style>
</head>
<body>
<article>
<h2>회원 목록</h2>
	<table border="1" class="manager">
		<tr>
			<th width="100px">아이디</th>
			<th width="90px">성명</th>
			<th width="150px">이메일</th>
			<th width="70px">현재 포인트</th>
			<!-- <th>누적 충전 금액(향후 구현)</th> -->
			<th align="center">가입일</th>
			<th align="center">정보 수정일</th>
			<th width="80px">판매자 여부</th>
		</tr>
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.mem_id }</td>
				<td>${member.mem_name }</td>
				<td>${member.mem_email }</td>
				<td align="right">${member.mem_point } </td>
				<!-- <td>아직 몰라</td> -->
				<td align="center">${member.mem_reg_date }</td>
				<td align="center">${member.mem_update_date }</td>
				<td align="center">${member.mem_vip }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="mainManager.ma">돌아가기</a><br>
	<br>
	</article>
</body>
</html>