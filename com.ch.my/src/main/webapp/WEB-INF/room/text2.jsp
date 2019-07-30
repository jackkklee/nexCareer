<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type05 th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    padding: 3px;
    vertical-align: top;
    text-align:left;
    border: none;
}

</style>
</head>
<body>
	<table class="type05">
		<tr><th width="100"></th><th width="500"></th></tr>
		<c:forEach var="a" items="${list}">
			<tr>
				<c:if test="${a.text_room_num==sessionScope['roomNum']}">
					<td>${a.text_mem_id}님:</td><td>${a.texts}</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>