<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="managerSessionChk.jsp" %>
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
	width: 80px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 2px solid #369;
}

table.manager td {
	width: 200px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: grey;
}
</style>
</head><body>      
   <b>관리 작업중입니다. </b><input type="button" value="로그아웃" 
  		  onclick="location.href='managerLogout.ma'"><br>  
   <table border="1" class="manager">
     <tr><th align="center">회원 관리</th></tr>
     <tr><td><a href="memberList.ma">회원 목록 보기</a></td></tr>
     <tr><td><a href="memberVipList.ma">판매자 신청 회원</a></td></tr>
     <!-- <tr><td>신고 접수 회원</a></td></tr> -->
   </table><br><br>
   <table>
<!--      <tr><th>매출 관리</th></tr>
     <tr><td><a href='chargeList.ma'>결제목록 확인</a></td></tr>
     <tr><td><a href='salesSum.ma'>매출 확인</a></td></tr> -->
   </table>
</body>
</html>