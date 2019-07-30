<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	function accept(id) {
		alert("승인되었습니다");
		location.href = "vipAccept.ma?mem_id=" + id;
	}
	function reject(id) {
		alert("반려되었습니다");
		location.href = "vipReject.ma?mem_id=" + id;
	}
</script>
</head>
<body>
	<article>
		<h2>판매자 신청 회원 목록</h2>
		<table border="1" class="manager">
			<tr>
				<th>아이디</th>
				<th>성명</th>
				<th>이메일</th>
				<th>현재 포인트</th>
				<!-- <th>누적 충전 금액(향후 구현)</th> -->
				<th>가입일</th>
				<th>정보 수정일</th>
				<th colspan="2" align="center">Yes or No</th>
			</tr>
			<c:forEach var="member" items="${list }">
				<tr>
					<td>${member.mem_id }</td>
					<td>${member.mem_name }</td>
					<td>${member.mem_email }</td>
					<td>${member.mem_point }</td>
					<!-- <td>아직 몰라</td> -->
					<td>${member.mem_reg_date }</td>
					<td>${member.mem_update_date }</td>
					<td><button onclick="accept('${member.mem_id }')">승인</button></td>
					<td><button onclick="reject('${member.mem_id }')">반려</button></td>
				</tr>

			</c:forEach>
		</table>

		<!-- 	만들 수 있다면<br>
	승인할 회원들 checkbox로 선택후 일괄 승인<br>
	안되는 회원들 checkbox로 선택후 일괄 반려<br> -->
		<a href="mainManager.ma">돌아가기</a>
	</article>
</body>
</html>