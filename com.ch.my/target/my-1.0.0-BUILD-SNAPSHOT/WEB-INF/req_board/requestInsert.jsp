<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<!-- <script type="text/javascript">
	$(function() {
		alert("게시글이 입력되었습니다");
		$.post('requestForm.up', 
			function(data) {
			$('#disp').html(data);
		});
	});
</script> -->
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		$(function() {
			alert("게시글이 입력되었습니다");
			$.post('reqBoardList.up', 
				function(data) {
				$('#disp').html(data);
			});
		});
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
	alert("에러 발생. 다시 시도해주세요.");
	history.go(-1);
	</script>
</c:if>
</body>
</html>