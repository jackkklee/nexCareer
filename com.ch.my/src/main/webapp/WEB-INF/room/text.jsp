<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result>0 }">
	<script type="text/javascript">
		$(function() {
			$.post("chat.do?num="+${num}, function(data) {
				$('#disp').html(data);
			});
		});
	</script>
</c:if>
<c:if test="${result<=0 }">
	<script type="text/javascript">
		alert("오류");
		history.go(-1);
	</script>
</c:if>
</body>
</html>