<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:if test="${count==1}">
	<script type="text/javascript">
		alert("채팅방이 삭제됩니다.");
		location.href = "roomMain.rm";
	</script>
</c:if>
<c:if test="${count!=1}"> --%>
	<script type="text/javascript">
		alert("퇴장되었습니다.");
		if (${count}==1) {
			alert("채팅방이 삭제됩니다");
		};
		location.href = "roomMain.rm";
	</script>
<%-- </c:if> --%>
</body>
</html>