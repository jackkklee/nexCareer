<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#rbdListDisp').load('replyList.rb?bno=${board.num}'); 
		$('#rInsert').click(function() {
			if(!frmm.replytext.value) {
				alert("댓글을 입력후에 사용하시오");
				frmm.replytext.focus(); return false;}
			/* var sendData = 'bno='+frm.bno.value+
							"&replyer="+frm.replyer+value+
							"&replytext="+frm.replytext.value; */
			var	sendData = $('#frmm').serialize();
							
			$.post('rInsert.rb',sendData, function(data) {
				alert("댓글이 작성되었습니다")
				$('#rbdListDisp').html(data);
				frmm.replytext.value= "";
			});
			
		}); 
 		$('#getip').ready(function() { // ip 뒤부터 2단 자르고 앞 2단 출력
			var ip = "${board.ip}";
			lip = ip.substring(0, 
				ip.lastIndexOf("."));
			llip = lip.substring(0, 
					lip.lastIndexOf("."))+".***.***";		
	 		$('#getip').append(llip);
			}); 
	});
	function rpList(b) {
		$('#disp').load("list.rb?pageNum=" + b);
	};
	function rpDelete(a, b) {
		$('#disp').load("deleteForm.rb?num=" + a + "&pageNum=" + b);
	};
	function rpUpdate(a, b) {
		$('#disp').load("updateForm.rb?num=" + a + "&pageNum=" + b);
	};
	function rpReply(a, b) {
		$('#disp').load("insertForm.rb?nm=" + a + "&pageNum=" + b);
	};
</script>

</head><body>
<div class="container" align="center">
	<h2>게시글 상세내역	</h2>
<table class="table table-hover">
	<tr><td>제목</td><td>${board.subject}</td></tr>
	<tr><td>작성자</td><td>${board.mem_id}</td></tr>
	<!-- member값 받아와야함 -->
	<tr><td>내용</td><pre><td>${board.content}</td></pre></tr>
	<%-- <tr><td>이메일</td><td>${board.email}</td></tr> --%>
	<tr><td>아이피</td><td id="getip"><%-- ${llip} --%></td></tr>
	<tr><td>조회수</td><td>${board.readcount}</td></tr>
	<tr><td>작성일</td><td>${board.reg_date}</td></tr>
	<tr><td colspan="2">
			<button class="btn btn-info" onclick="rpList('${pageNum}')">게시글 목록</button>
		<c:if test="${sessionScope.id == board.mem_id }"> 
			<!-- 세션과 보드아이디 비교-->
			<button class="btn btn-warning" onclick="rpUpdate('${board.num}','${pageNum}')">수정</button>
			<button class="btn btn-danger" onclick="rpDelete('${board.num}','${pageNum}')">삭제</button>
		</c:if>
			<button class="btn btn-success" onclick="rpReply('${board.num}','${pageNum}')">답변</button>
	</table>
<form name="frmm" id="frmm" >
	<input type="hidden" name="bno" value="${board.num }">
<table class="table table-hover" style="float: left;">
	<!-- 원래는 login한 사람 이름 또는 ID -->
	<tr><td>작성자</td><td><input type="text"
		value="${member.mem_name}" size="4" disabled="disabled"></td>
		<td><input type="hidden" name="replyer"
		value="${member.mem_name}" size="4" ></td>
		<!-- hidden으로 값 받음 -->
	<td>댓글</td><td><textarea rows="3" cols="30" name="replytext"></textarea>		
	<td colspan="2"><input type="button" value="댓글입력"
	 	id="rInsert"></td></tr>
</table>	
</form>	
	<div id="rbdListDisp"></div>
</div>

</body>
</html>