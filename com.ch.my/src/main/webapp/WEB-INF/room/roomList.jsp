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
	    $('#exitRoom').click(function () {
	    	var sendData = "count="+$("#Count").val();
	        $.post('exitRoom.rm',sendData,
	        function(data) {
				$('#disp').html(data);
	    	});
		});
	});
    $('#enter').on('click', function () {
        if($('#id').val() == ""){
            alert($('#id').attr('data-msg')+' 후 이용가능합니다');
        	$.post('logonNeed.rm',
        	function(data) {
				$('#disp').html(data);
			});
        }
    });
</script>
</head>
<body>
	<input type="hidden" id="Count"  value="${room.people_count}">
	<input type="hidden" value="${sessionScope['id']}" id="id" data-msg="로그인">
	<c:set var="roomNum" value="${sessionScope['roomNum']}"></c:set>
	<c:set var="id" value="${sessionScope['id']}"></c:set>
	<div class="container" align="center" id="">
		<c:if test="${!empty id}">
			<c:if test="${member.room_num>0}">
				<h4 align="left" class="err">${room.room_subject}에 입장 중 이십니다. 퇴장 후 이용바랍니다<br>
				<button align="left" class="btn btn-warning" id="exitRoom">${room.room_subject} 퇴장</button></h4>
			</c:if>
		</c:if>
		<table class="table table-striped">
			<c:if test="${empty list}">
				<tr><td colspan="5">데이터가 없습니다 </td></tr>
			</c:if>
			<tr>
				<th>번호</th><th>방제목</th><th>방장</th><th>인원수</th><th></th><th></th>
			</tr>
			<%-- <c:set var="myNum" value="${num }" /> --%>
			<c:forEach var="a" items="${list }" varStatus="i">
				<tr>
					<td>${count - i.index }</td><td>${a.room_subject }</td>
					<td>${a.room_mem_id }</td>
					<td>${a.people_count} / ${a.room_people }</td>
					<td>
						<button onclick="m(${a.people_count},${a.room_people},${a.room_num},'${a.room_subject}')" id="enter" class="btn btn-success">입장하기</button>
					</td>
					<td>
						<c:if test="${ sessionScope['roomNum'] == a.room_num }">
							<a class="btn btn-danger">
								참여중
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" class="btn btn-success" id="rmInsertForm" value="방만들기">
	</div>
</body>
</html>
		<%--href="http://192.168.40.10:8181/my/chat.do?count=${a.people_count }" --%>
