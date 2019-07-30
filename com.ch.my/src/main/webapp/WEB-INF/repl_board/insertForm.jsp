<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호 확인이 다릅니다");	 frm.passwd.value="";
			frm.passwd.focus();		return false;
		}
		
	}
</script>
<style type="text/css">
#sidemenu {
	width: 250px;
	height: 400px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	text-align: center;
	background-color: white;
}
</style>
</head><body>
<div class="container">
	<h2>게시글 입력</h2>
<form action="insert.rb" method="post" name="frm"
	onsubmit="return chk()">
	<input type="hidden" name="mem_id" 	value="${member.mem_id}">
	<input type="hidden" name="ref" 	value="${ref}">
	<input type="hidden" name="re_level" value="${re_level}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="num"		 value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">	
<table class="table table-hover">
	<tr><td>제목</td><td><input type="text" name="subject"
		required="required" autofocus="autofocus"></td></tr>
	<tr><td>작성자</td><td><input type="text" name="mem_name"
		 value="${member.mem_name}" disabled="disabled"></td></tr>
		
	 <tr><td>이메일</td><td><input type="email" name="mem_email"
		required="required" disabled="disabled"
		value="${member.mem_email}"></td></tr>
	<!-- <tr><td>암호</td><td><input type="password" name="passwd"
		required="required"></td></tr>
	<tr><td>암호확인</td><td><input type="password" name="passwd2"
		required="required"></td></tr> -->
	<tr><td>내용</td><td><textarea rows="5" cols="40" name="content"
		required="required"></textarea> </td></tr>
	<tr><td colspan="2"><input type="submit" value="확인"></td></tr>
							
</table>
</form>	
</div>
</body>
</html>