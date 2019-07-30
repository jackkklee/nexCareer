<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var websocket;
	$(function() {
		$('#enterBtn').click(function() {	connect();		});
		$('#exitBtn').click(function() {	disconnect();	});
		$('#sendBtn').click(function() {	send();			});
		$('#message').keypress(function(event) {
			var keycode=event.keyCode?event.keyCode:event.which;
			if (keycode==13) send();
			event.stopPropagation(); // 이벤트를 전달하지 말 것 
		});
	}); 
	function connect() {
		var url = window.location.host;// 웹브라우저의 주소창의 포트까지 가져옴
		var pathname = window.location.pathname;
		var appCtx = pathname.substring(0, pathname.indexOf("/", 2));
		var root = url + appCtx;
		websocket = new WebSocket("ws://" + root + "/chat_ws.do");
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	function onOpen() {
	var nickname= $('#nickname').val();
		appendMessage(nickname+"님이 입장했습니다");
	}
	function onMessage(event) {
		var msg = event.data;
		appendMessage(msg);
	}
	function appendMessage(msg) {
		$('#chatMessage').append(msg+'<br>');
	}
	function onClose() {
		var nickname= $('#nickname').val();
		appendMessage(nickname+"님이 퇴장했습니다");
	}
	function disconnect() {
		websocket.close();
	}
	function send() {
		var nickname= $('#nickname').val();
		var message = $('#message').val();
		websocket.send(nickname+'=>'+message); //메세지 보내기
		$('#message').val(''); //보낸메세지 삭제
	}
</script></head><body>

<div class="container">
<h2>${num }번</h2>
<table class="table table-hover">
<%-- 	<c:if test='${num==num }'>
		성공roomList.rm
	</c:if> --%>
<%-- 	<c:set value="${num }" var ="nm"></c:set>
	<form action="" name="frm"><!-- +frm.sessionNum.value() -->
		<input type="hidden" name="sessionNum" value="${num}" >
	</form>	 --%>
	<c:if test="">
		
	</c:if>
	<tr><td>별명</td><td><input type="text" id="nickname">
	<input type="button" id="enterBtn" value="입장"
		class="btn btn-info">
		<input type="button" id="exitBtn" value="퇴장"
		class="btn btn-warning"></td></tr>
	<tr><td>메세지</td><td><input type="text" id="message">
	<input type="button" id="sendBtn" value="전송"
		class="btn btn-success"></td></tr>
	<tr><td>대화 영역</td><td><div id="chatArea">
		<div id="chatMessage"></div></div></td></tr>
</table>
</div>	
</body>
</html>