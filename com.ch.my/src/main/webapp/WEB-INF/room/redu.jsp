<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	if (${num}<=0) {
		document.write("잘못된 경로");
		location.href = "roomMain.rm";
	}
	var test = confirm("기존 방에서 퇴장 후 입장해주세요.\n"+${num}+"번방으로 이동합니다.");
	if (test==true) {
		$(function() {
			$.post("chat.do?num="+${num}+"&subject="+${subject}, function(data) {
				$('#disp').html(data);
			});
		});
	}
	if (test==false) {
		location.href = "roomMain.rm";
	}
</script>
<body>
</body>
</html>