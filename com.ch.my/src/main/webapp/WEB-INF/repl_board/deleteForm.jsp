<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">	
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
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
</head>
<body>
<div class="container">
	<h2>삭제확인</h2>
<form action="delete.rb" method="post" name="frm"
	onsubmit="return chk()">
	<input type="hidden" name="num" value="${board.num}">
	<input type="hidden" name="passwd" value="${member.mem_passwd}"> <!-- mpass값 받아와야함 -->
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table class="table table-hover">
	<tr><td>암호확인</td><td><input type="password" name="passwd2"
		required="required"></td></tr>
		<tr><td colspan="2"><input type="submit" value="확인"></td></tr>						
</table>
</form>	
</div>
</body>
</html>