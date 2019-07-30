<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function () {
		$('#rmInsertForm').click(function () {
			$.post('roomInsertForm.rm',
			function(data) {
				$('#disp').html(data);
			});
		});
		return false;
	});
    $('#enter').on('click', function () {
        if($('#id').val() == ""){
            alert($('#id').attr('data-msg')+' 후 이용가능합니다');
        	$.post('logonNeed.rm', function() {
				$('#disp').html(data);
			});
        }/* else{
            $('#form').attr("target", "self").submit();
        } */
    });
</script>
</head>
<body>
	<input type="hidden" value="${sessionScope['id']}" id="id" data-msg="로그인">
	<div class="container" align="center" id="">
		<table class="table table-striped">
			<c:if test="${empty list}">
				<tr><td colspan="5">데이터가 없습니다 </td></tr>
			</c:if>
				<tr>
					<th>번호</th><th>방제목</th><th>방장</th><th>인원수</th><th></th>
				</tr>
			<c:forEach var="a" items="${list }" varStatus="i">
				<tr>
					<td>${count - i.index }</td><td>${a.room_subject }</td>
					<td>${a.room_mem_id }</td>
					<td>${a.people_count} / ${a.room_people }</td>
					<td><a id="enter" class="btn btn-warning" href="http://192.168.40.10:8181/my/chat.do?num=${a.room_num }&count=${a.room_count }">입장하기</a></td>
				</tr>
			</c:forEach>
		</table>
		<button id="rmInsertForm"  class="btn btn-success">방만들기</button>
	</div>
</body>
</html>