<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- path = /프로젝트명 -->
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="${path}/js/jquery.js"></script>
<style> .err { color: red; font-weight: bold; }</style>