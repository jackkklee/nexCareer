<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var insertCheck = confirm(${num}+"번 방에 입장중이십니다.\n퇴장하고 진행하시겠습니까?");
	if (insertCheck==true) {
		$(function() {
			$.post("roomInsertForm2.rm", function(data) {
				$('#disp').html(data);
			});
		}); 
	}
	if (insertCheck==false) {
		location.href = "roomMain.rm";
	}
</script>
</body>
</html>