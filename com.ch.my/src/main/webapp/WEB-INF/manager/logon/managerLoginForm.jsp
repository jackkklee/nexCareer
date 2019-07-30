<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
article {
	width: 650px;
	height: 425px;
	/* float: right; */
	margin-left: 30%;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
}

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
	border-bottom: 1px solid #ccc;
	border-right: 2px solid #369;
}

table.manager td {
	width: 200px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.subbutton {
	margin-left: 150px;
}
</style>
</head>
<body>
	<article>
		<form action="managerLogin.ma">
			<table border="1" class="manager">
				<h2>　관리자 로그인</h2>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="managerid" required="required" 
						autofocus="autofocus"></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="text" name="managerpasswd" required="required"></td>
				</tr>
			</table>
			<p>
				<input type="submit" value="확인" class="subbutton">
		</form>
	</article>
</body>
</html>