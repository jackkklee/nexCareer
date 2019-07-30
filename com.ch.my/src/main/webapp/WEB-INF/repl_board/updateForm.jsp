<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.mem_passwd.value != frm.passwd2.value) {
			alert("암호 확인이 다릅니다");	 frm.passwd2.value="";
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
<%-- <c:url var="url" value="/update"></c:url>	 --%>
<form action="update.rb" method="post" name="frm"
	onsubmit="return chk()">
	<input type="hidden" name="num" value="${board.num}">
	<%-- <input type="hidden" name="passwd" value="${board.passwd}"> --%>
	<input type="hidden" name="mem_passwd" value="${member.mem_passwd}">
	<!-- member 연결안됨 -->
	<input type="hidden" name="pageNum" value="${pageNum}">
<table class="table table-hover">
	<tr><td>제목</td><td><input type="text" name="subject"
		required="required" autofocus="autofocus"
		value="${board.subject}"></td></tr>
	<tr><td>작성자</td><td><input type="text" name="mem_id"
		required="required" value="${member.mem_id}" disabled="disabled"></td></tr>
	<%-- <tr><td>이메일</td><td><input type="email" name="email"
		required="required" value="${board.email}"></td></tr> --%>
		
	<tr><td>암호확인</td><td><input type="password" name="passwd2"
		required="required"></td></tr>
	<tr><td>내용</td><td><pre><textarea rows="5" cols="40" name="content"
		required="required">${board.content}</textarea></pre></td></tr>
	<tr><td colspan="2"><input type="submit" value="확인"></td></tr>						
</table>
</form>	
</div>
</body>
</html>