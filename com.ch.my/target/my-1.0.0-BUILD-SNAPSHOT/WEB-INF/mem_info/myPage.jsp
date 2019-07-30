<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


article {
	width: 650px;
	height: 800px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
}

table.charge {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
  	margin : 10px 10px;
  	font-size: 13px;
  	width: 450px;
}
table.charge th {
    /* width: 147px; */
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #369;

}
table.charge td {
    /* width: 349px; */
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

table.charge2 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
  	margin : 10px 10px;
  	font-size: 13px;
  	width: 450px;
}
table.charge2 th {
    /* width: 147px; */
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-bottom: 1px solid #ccc;
    border-right: 2px solid #369;

}
table.charge2 td {
    /* width: 349px; */
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
article {
	width: 650px;
	height: 800px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
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
.char1 {margin-left: 50px; }
.subbutton {margin-left: 240px; }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#myDownList').click(
			function() {
				$.post('myDownList.up',
						function(data) {
							$('#disp').html(data);
						});
				return false;
			});
		$('#myChargeList').click(
				function() {
					$.post('myChargeList.up',
							function(data) {
								$('#disp').html(data);
							});
					return false;
				});
		$('#updateForm').click(
				function() {
					$.post('updateForm.up',
							function(data) {
								$('#disp').html(data);
							});
					return false;
				});
		$('#delete').click(
				function() {
					$.post('delete.up',
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
	<c:set var="id" value="${sessionScope['id']}"></c:set>
	<c:if test="${empty id}">
				<table border="1" class="charge">
	
					<tr>
						<th>로그인이<br>필요합니다
						</th>
						<td><a href="logonForm.lo">
								<button>판도라 박스 로그인</button>
						</a></td>
					</tr>
				</table>
		</c:if>
		<c:if test="${!empty id}">
			<!-- 	<h2>회원 정보</h2> -->
			<table border="1" class="charge2">
				<tr>
					<td colspan="2"><font size="4" style="font-weight: bold">회원정보</font></td>
				<tr>
					<th>아이디</th>
					<td>${sessionScope['id']}</td>
				</tr>

				<tr>
					<th>포인트</th>
					<td>${member.mem_point}</td>
				</tr>

				<tr>
					<th>이메일</th>
					<td>${member.mem_email}</td>
				</tr>

				<tr>
					<th>가입일</th>
					<td>${member.mem_reg_date}</td>
				</tr>

				<tr>
					<th>판매자<br>회원여부
					</th>
					<td><c:if test="${member.mem_vip=='y'}">판매자회원</c:if> <c:if
							test="${member.mem_vip=='n'}">일반회원</c:if></td>
				<tr>
					<td  colspan="2">
						<a id="myDownList" class="cursor">다운로드내역 바로가기</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a id="myChargeList" class="cursor">충전내역 바로가기</a>
					</td>				
				</tr>
				<tr>
					<td  colspan="2">
						<a id="updateForm" class="cursor">회원정보수정</a>
					</td>						
				</tr>
				<tr>
					<td  colspan="2">
						<a id="delete" class="cursor">회원탈퇴</a>
					</td>						
				</tr>
			</table>
		</c:if>
	</article>
</body>
</html>