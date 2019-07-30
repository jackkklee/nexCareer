<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{  text-align: center;}
</style>
<script type="text/javascript">
	$(function() {
		$.post('text2.rm', 
				function(data) {
					$('#disp2').html(data);
			});
		$.post('chat.do', 
				function(data) {
					$('#disp').html(data);
			});
		/* var offset = $("#sendBtn").offset(); */
		/* $('html, body').animate({scrollTop : offset.top+99999},50); */
		var frm = document.form.texts; 
		frm.focus(); 
		/* 메세지전송 */
		$('#texts').keypress(function(event) {
			var keycode=event.keyCode?event.keyCode:event.which;
			if (keycode==13) {		var sendData = $('#texts').serialize();
			$.post('text.rm', sendData,
				function(data) {
					$('#disp2').html(data);
					$("#disp2").scrollTop($("#disp2")[0].scrollHeight);
				});
				/* var offset = $("#sendBtn").offset(); */
			   /*  $('html, body').animate({scrollTop : offset.top+99999},50); */
				var frm = document.form.texts; 
				$('#texts').val(''); //보낸메세지 삭제
				frm.focus();  }
			event.stopPropagation(); // 이벤트를 전달하지 말 것 
		});
	});
 	var timeout = setInterval(reloadChat, 1000);    
	function reloadChat() {
		$.post('text2.rm', 
			function(data) {
				$('#disp2').html(data);
				$("#disp2").scrollTop($("#disp2")[0].scrollHeight);
		});
		var offset = $("#sendBtn").offset();
	    /* $('html, body').animate({scrollTop : offset.top+99999},50); */
		var frm = document.form.texts; 
		frm.focus();  
	} 
/* 	window.setInterval($(function() {
		$.post('text2.rm', 
			function(data) {
				$('#disp2').html(data);
			});
			var frm = document.form.texts; 
			frm.focus();  
		}), 1000); */
	$(function () {
		$('#sendBtn').click(function () {
			var sendData = $('#texts').serialize();
			$.post('text.rm', sendData,
			function(data) {
				$('#disp2').html(data);
			});
			var offset = $("#sendBtn").offset();
		    $('html, body').animate({scrollTop : offset.top+99999},50);
			var frm = document.form.texts; 
			$('#texts').val(''); //보낸메세지 삭제
			frm.focus();  
		});
	    $('#exitRoom').click(function () {
	    	var sendData = "count="+$("#Count").val();
	        $.post('exitRoom.rm',sendData,
	        function(data) {
				$('#disp').html(data);
	    	});
		});
	    $('#delete').click(function () {
			$.post('text3.rm', 
				function(data) {
					$('#disp2').html(data);
				});
				var offset = $("#sendBtn").offset();
			    $('html, body').animate({scrollTop : offset.top+99999},50);
				var frm = document.form.texts; 
				frm.focus(); 
		});
	}); 
	function len_chk(){  
		  var frm = document.form.texts; 
		  if(frm.value.length > 60){  
		       alert("너무 기네요.60자 내로 쓰세요");  
		       frm.value = frm.value.substring(0,60);  
		       frm.focus();  
		  }
	}
</script>
<style type="text/css">
table.type03 {
    border-collapse: collapse;
    text-align: right !important;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
 	margin : 20px 10px;
}
table.type03 th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
table.table {width:650px;}
div #disp2 { height: 260px; word-break:break-all;clear:both;overflow: hidden;}
</style>
</head><body>
<div class="container">
	<h2>${room.room_subject }</h2>
	<!-- <table class="type05">
		<tr><th colspan="2"></th></tr>
		<tr><td></td><td></td></tr>
	</table> -->
	<div id="disp2" class="container"></div>
	<input type="hidden" id="disp3">
	<table class="type03">
		<tr><th>참여인원</th>
			<c:forEach var="a" items="${list }" varStatus="i">
				<c:if test="${a.room_num==num }">
					<td>${a.mem_id }</td>
				</c:if>
				<c:set var="end" value="${i.index}"></c:set>
			</c:forEach>
		</tr>
		<tr><th>현재인원</th><td colspan="${end}" align="left">${room.people_count} / ${room.room_people}</td></tr>
	</table>
	<table class="table table-hover">
		<tr>
			<td>메세지</td>
			<td>
				<form action="" name="form">
					<textarea rows="3"  onkeyup="len_chk()" cols="38" name="texts" id="texts"/>
				</form>
				<input type="button" id="sendBtn" value="전송" class="btn btn-success">
				<input type="button" id="exitRoom" onkeyup="enterkey();" value="퇴장하기" class="btn btn-danger">
				<input type="button" id="delete" value="대화내용삭제" class="btn btn-info">
				<input type="hidden" id="Count"  value="${room.people_count}">
			</td>
		</tr>
	</table>
</div>	
</body>
</html>