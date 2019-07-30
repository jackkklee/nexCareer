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
	border-bottom: 1px solid #ccc;
	border-right: 2px solid #369;
}

table.reqbo td {
	/* width: 349px; */
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	width: 500px;
}


.subbutton {margin-left: 240px; }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#request2').click(function() {
			var sendData = $('#form1').serialize();
			$.post('request.up', sendData,/* frm.cate.value */
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
		<form action="" method="post" id="form1">
			<table border="1" class="reqbo">
				<tr>
					<th>작성자</th>
					<td width="350px"><input type="hidden" name="writer" value="${sessionScope['id']}">${sessionScope['id']}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" size="67px"  required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td><select name="category" >
							<option>도서</option>
							<option>음악</option>
							<option>이미지</option>
							<option>교육</option>
							<option>유틸</option>
							<option>기타</option>
					</select></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" cols="70" rows="30" required="required" autofocus="autofocus"></textarea></td>
			</table>
			<p>
			<input type="submit" id="request2" value="요청하기" class="subbutton">
		</form>
	</article>
</body>
</html>