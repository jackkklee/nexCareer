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
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("로그인 성공");
		location.href="roomMain.rm";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("암호를 다시 입력해주세요");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("누구냐 너");
		history.go(-1);
	</script>
</c:if>
</body>
</html>