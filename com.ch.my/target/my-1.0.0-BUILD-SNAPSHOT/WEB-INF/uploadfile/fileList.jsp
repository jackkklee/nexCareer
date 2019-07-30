<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.out {
	 width: 100%;
	 text-align: center;
 }
.in {
	 display: inline-block;
 }

article {
	width: 750px;
	height: 800px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
}

table.filelist {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	margin: 10px 10px;
	font-size: 13px;
}
table.filelist thead th {
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.filelist tbody th {
    width: 150px;
    padding: 5px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.filelist td {
	font-size: 13px;
    padding: 10px;
    text-align: center;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
input.sub_button {
	background-color: white;
	color: black;
	cursor: pointer;
	font-size: 14px;
	font-weight: bold;
	border-style: hidden;
	border-radius: 10px;
}
input.sub_button:hover {
	text-decoration: underline;
	background-color: #BDBDBD;
}
table.reqbo {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	margin: 10px 10px;
	font-size: 13px;
}
#sidemenu {
	width: 250px;
	height: 400px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	text-align: center;
	background-color: white;
}

</style>
<!-- <script src="../js/jquery.js"></script> -->
<script type="text/javascript">
	function chk(file_num,id) {
		if (id==null || id=="")	{
			alert("로그인이 필요한 서비스입니다");
			location.href="logonForm.lo";
			return;
		}
		window.open("fileSelect.up?file_num="+file_num+"&id="+id,"", "width=650 height=500");
	}
</script>
</head>
<body>

<article>
<c:set var="id" value="${sessionScope['id']}"></c:set>
	<table class="filelist" border="1">
		<thead>
			<tr>
				<th width="139px">사진</th>
				<th width="300px">제목</th>
				<th width="100px">분류</th>
				<th width="100px">포인트</th>
				<th width="100px">용량</th>
				<th width="100px">판매자</th>
			</tr>
		</thead>
		<tbody>
		
		
			<c:forEach var="fileup" items="${list}">
				<tr>
					<c:if test="${fileup.file_del=='y' }">
						<td colspan="6">블라인드 처리된 글입니다</td>
					</c:if>
					<c:if test="${fileup.file_del!='y' }">
					<th colspan="1"><img width="139px" height="45px" alt="파일 없음" 
					src="fileSave/${fileup.file_shot }"></th>
					<th><button class="sub_button"
							onclick="chk('${fileup.file_num}','${id}')">${fileup.file_name}</button></th>
					<td>${fileup.category }</td>
					<td>${fileup.file_point }pt</td>
					<td>${fileup.file_size/1000 }KB</td>
					<td>${fileup.mem_id }</td>
					</c:if>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<div class="out">
		<div class="in">
			<c:if test="${ startPage > pagePerBlock }">
				<input type="button" id="back" onclick="a2('${category }',${startPage-1})" value="이전" class="sub_button">
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<input type="button" id="pgNm" onclick="a1('${category }',${i})" value="${i}"  class="sub_button">
			</c:forEach>
			<c:if test="${endPage<totPage}">
				<input type="button" id="next" onclick="a3('${category }',${endPage+1})" value="다음"  class="sub_button">
			</c:if>
		</div>
	</div>
</article>

 
</body>
</html>