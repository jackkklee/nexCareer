<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 	$(function () {
		$('#rmInsert').click(function () {
			/* var sendData = $('#frm').serialize(); */
			var sendData = "room_subject="+$("#room_subject").val()+"&room_people="+$("#room_people").val();
			$.post('roomInsert.rm', sendData,
			function(data) {
				$('#disp').html(data);
			});
		});
	}); 
</script>
</head>
<body>
<c:set var="id" value="${sessionScope['id']}"></c:set>
<div align="center">
	<form action="" name="frm" id="frm">
		<table border="1" class="reqbo">
			<tr>
				<th>작성자</th>
				<td width="350px">
					${id}
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="room_subject" value="${id }님의 채팅방" id="room_subject" size="67px" required="required"  autofocus="autofocus"></td>
			</tr>
			<tr>
				<th>인원수</th>
				<td><select name="room_people" id="room_people">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					</select>
				</td>
			</tr>
		</table>
		<p>
		<input type="button" id="rmInsert"  value="만들기" class="btn btn-info">
	</form>
</div>
</body>
</html>