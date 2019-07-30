<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../bootstrap.jsp"/>
<script type="text/javascript">
	/* 처음 페이지실행시 자동실행 */
 	$(function() {
		$.post('roomList.rm', function(data) {
			$('#disp').html(data);
		});
	});
	/* 채팅방불러오기 */
	function m(count,allPeople,num,subject1) {
/* 		alert ("count="+count+",allPeople="+allPeople+",num="+num+",subject1="+subject1+",frm.num.value="+frm.num.value);
 */		if (count==allPeople) {
			if (frm.num.value==num) {
				$('#disp').load("chat.do?num="+num);
			}else alert("정원초과");
		}else {
			$('#disp').load("chat.do?num="+num);
		}
	}  
</script>
<body>
	<form action="" id="frm">
		<input type="hidden" name="num" value="${sessionScope['roomNum']}" id="num">
	</form>
	<div class="container" align="center">
		<span>
				<img alt="" src="images/2010.jpg" width="180px">
		</span>
		<div id="disp"></div>
	</div>
</body>
</html>